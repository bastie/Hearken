import Foundation
import System

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
                fileManager.fileExists(atPath: requestedFilePath, isDirectory: &isDir)
                if (isDir.boolValue) {
                    body =  """
                            <html><body><h1>DIRECTORY BROWSING NOT SUPPORTED</h1></body></html>
                            """
                }
                else {
                    body =  """
                            <html><body><h1>FILE REQUESTED</h1></body></html>
                            """
                }
            }

            result = HTTPResponse(status: .notFound, headers: [.contentType(.html)],
            body: HTTPBody(stringLiteral: body))
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
