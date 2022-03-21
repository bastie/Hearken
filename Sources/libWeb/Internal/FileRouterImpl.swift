import Foundation

/// Simple ``Router`` protocol implementation to provide files from underlying filesystems.
public final class FileRouterImpl : Router {
    public init (){}
    
    let fileManager : FileManager = .init()
    public var routes: [HTTPRoute: (HTTPRequest) -> HTTPResponse] = [:]

    public func route(request: HTTPRequest) -> HTTPResponse? {
        var result =
        routes.first { $0.key == request.route }
            .map { $0.value(request) }

        if result == nil {
            
            let requestedFilePath = fileManager.currentDirectoryPath + request.route.uri
            var body = """
                  <htlm>
                  <body>
                  <h1>NOT FOUND</h1>
                  </body>
                  </html>
                  """
            if fileManager.fileExists(atPath: requestedFilePath) {
                var isDir : ObjCBool = false
                let _ = fileManager.fileExists(atPath: requestedFilePath, isDirectory: &isDir)
                if (isDir.boolValue) {
                    body =  """
                            <html><body><h1>directory browsing is forbidden</h1></body></html>
                            """
                    result = HTTPResponse(status: .forbidden, headers: [.contentType(.html)], body: HTTPBody(stringLiteral: body))
                }
                else {
                    let url = URL (fileURLWithPath: requestedFilePath)
                    if let content = try? HTTPBody (contentsOf: url) {
                        result = HTTPResponse (status: .ok, headers: [], body: content)
                    }
                    else {
                        body =  """
                                <html><body><small>server error</small></body></html>
                                """
                        result = HTTPResponse(status: .internalServerError, headers: [.contentType(.html)], body: HTTPBody(stringLiteral: body))
                    }
                }
            }
            else {
                result = HTTPResponse(status: .notFound, headers: [.contentType(.html)], body: HTTPBody(stringLiteral: body))
            }
        }
        return result
    }
}



extension FileManager {
    func isDirectory(atPath: String) -> Bool {
        var check: ObjCBool = false
        if fileExists(atPath: atPath, isDirectory: &check) {
            return check.boolValue
        } else {
            return false
        }
    }
}
