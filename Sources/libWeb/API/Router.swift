public protocol Router {

    func route(request: HTTPRequest) -> HTTPResponse? ;
}
