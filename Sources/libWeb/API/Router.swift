public protocol Router {
    var routes : [HTTPRoute: (HTTPRequest) -> HTTPResponse] {get set }
    func route(request: HTTPRequest) -> HTTPResponse? ;
}
