using Connector.SignalR.Protocol;
using F1.Common;
using System.Collections.Concurrent;
using System.Diagnostics.CodeAnalysis;
using System.Text.Json;

namespace F1.LiveTelemetry.SignalR;

internal class InvocationManager
{
	private string? hubName;
	private SignalRProcessor processor;

	private ConcurrentDictionary<string, InvocationRequest> invocationRequests = new ConcurrentDictionary<string, InvocationRequest>();
	private string UniqueInvocationId => DateTime.Now.Millisecond + Guid.NewGuid().ToString("N");

	public TimeSpan WaitResponseTimeout = TimeSpan.FromSeconds(5);

	public InvocationManager(SignalRProcessor _processor)
	{
		processor = _processor;
	}

	public InvocationManager(HubConnection hubConnection)
	{
		processor = hubConnection.Processor;
		hubName = hubConnection.Name;
	}

	private InvocationRequest CreateMessage<T>(bool withInvocationId, string Target, params object[] Objects)
	{
		string? invocationId = withInvocationId ? UniqueInvocationId : null;
		InvocationMessage invocationMessage = new InvocationMessage(invocationId, Target, Objects);

		InvocationRequest invocationItem = new InvocationRequest(typeof(T))
		{
			InvocationId = invocationId,
			RequestMessage = invocationMessage
		};

		if (withInvocationId && invocationId != null)
		{
			invocationRequests.TryAdd(invocationId, invocationItem);
		}

		return invocationItem;
	}

	private async Task<CompletionMessage?> WaitForCompletionResponse(InvocationRequest invocationItem)
	{
		TaskCompletionSource<CompletionMessage?> taskCompletionSource = new TaskCompletionSource<CompletionMessage?>();
		invocationItem.TaskPromise = taskCompletionSource;

		await Task.WhenAny(taskCompletionSource.Task, Task.Delay(WaitResponseTimeout));

		if (taskCompletionSource.Task.Result is not null)
		{
			return taskCompletionSource.Task.Result;
		}
		else
		{
			return new CompletionMessage(invocationItem.InvocationId, "Request timed out", null, false);
		}
	}

	public async Task<InvocationResponse<T>?> SendInvocation<T>([NotNull] InvocationRequest request)
	{
		byte[] messageData = request.RequestMessage.SeralizeMessage(HubProtocolConstants.InvocationMessageType);
		await processor.Send(messageData);

		if (request.InvocationId is null)
		{
			return null;
		}

		InvocationResponse<T> response = new InvocationResponse<T>();
		CompletionMessage? completionMessage = await WaitForCompletionResponse(request);

		if (completionMessage?.Result is JsonElement element)
		{
			response.Response = element.Deserialize<T?>();
			return response;
		}
		else // This should throw an exception
		{
			response.ErrorMessage = completionMessage?.Error ?? "An unknown error occured";
		}

		return response;
	}

	public async Task<InvocationResponse<T>?> SendInvocation<T>(bool withInvocationId, string Target, params object[] Objects)
	{
		return await SendInvocation<T>(CreateMessage<T>(withInvocationId, Target, Objects));
	}

	public bool TryGetMessage(string invocationId, [NotNullWhen(true)] out InvocationRequest request)
	{
		return invocationRequests.TryGetValue(invocationId, out request);
	}

	public void ClearInvocationQueue()
	{
		foreach (KeyValuePair<string, InvocationRequest> item in invocationRequests)
		{
			if (item.Value?.TaskPromise is not null && !item.Value.TaskPromise.Task.IsCompleted)
			{
				item.Value?.TaskPromise?.SetCanceled();
			}
		}

		invocationRequests.Clear();
	}

	public void SetCompletionMessage(CompletionMessage completionMessage)
	{
		if (completionMessage == null || completionMessage.InvocationId == null)
		{
			return;
		}

		if (invocationRequests.Remove(completionMessage.InvocationId, out InvocationRequest? item))
		{
			item.CompletionMessage = completionMessage;
			item.TaskPromise?.TrySetResult(completionMessage);
		}
	}
}