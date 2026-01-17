using RestSharp;
using System.Text.Json;
using System.Text.Json.Nodes;
using System.Text.Json.Serialization;

namespace F1.Common;

internal static class RestClientExtensions
{
    internal static async Task<T?> DeserializeEndpoint<T>(this RestClient client, string endPoint, params Tuple<string, string>[] parameters)
    {
        var req = new RestRequest(endPoint);
        req.Method = Method.Get;
        req.RequestFormat = DataFormat.Json;

        if (parameters != null && parameters.Length > 0)
        {
            foreach (Tuple<string, string> segment in parameters)
            {
                req.AddParameter(segment.Item1, segment.Item2);
            }
        }

        RestResponse? response = await client.GetAsync(req);
        if (response == null)
        {
            return default;
        }

        JsonNode? node = JsonNode.Parse(response.Content);
        if (node == null)
        {
            return default;
        }

        return node["MRData"].Deserialize<T>(new JsonSerializerOptions
        {
            NumberHandling = JsonNumberHandling.AllowReadingFromString
        });
    }
}
