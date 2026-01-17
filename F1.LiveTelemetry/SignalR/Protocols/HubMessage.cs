// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

using System.Text.Json.Serialization;

namespace Connector.SignalR.Protocol;

/// <summary>
/// A base class for hub messages.
/// </summary>
public abstract class HubMessage
{
    [JsonPropertyName("T")]
    public int Type { get; set; }
}
