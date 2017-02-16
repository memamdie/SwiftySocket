
protocol SocketIOClientSpec : class {
    var nsp: String { get set }
    var waitingPackets: [SocketPacket] { get set }
    
    func didConnect()
    func didDisconnect(reason: String)
    func didError(reason: String)
    func handleAck(_ ack: Int, data: [Any])
    func handleEvent(_ event: String, data: [Any], isInternalMessage: Bool, withAck ack: Int)
    func joinNamespace(_ namespace: String)
}

extension SocketIOClientSpec {
    func didError(reason: String) {
        DefaultSocketLogger.Logger.error("%@", type: "SocketIOClient", args: reason)
        
        handleEvent("error", data: [reason], isInternalMessage: true, withAck: -1)
    }
}
