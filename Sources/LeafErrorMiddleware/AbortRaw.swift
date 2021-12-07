import Vapor

/// Raw Implementation of `AbortError`. Use this to send the raw error back to the peer
/// instead of rending a leaf error page
///
///     throw Abort(.badRequest, reason: "Something's not quite right...")
///
public struct AbortRaw: AbortError, DebuggableError {
    /// See `AbortError`
    public var status: HTTPResponseStatus

    /// See `AbortError`.
    public var headers: HTTPHeaders

    /// See `AbortError`
    public var reason: String

    public init(
    _ status: HTTPResponseStatus,
    headers: HTTPHeaders = [:],
    reason: String? = nil) {
        self.status = status
        self.headers = headers
        self.reason = reason ?? status.reasonPhrase 
    }

}