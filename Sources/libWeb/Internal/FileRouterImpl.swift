import Foundation

final class FileRouter {
    let fileManager : FileManager = .init()
    var routes: [HTTPRoute: (HTTPRequest) -> HTTPResponse] = [:]

    func route(request: HTTPRequest) -> HTTPResponse? {
        var result =
        routes.first { $0.key == request.route }
            .map { $0.value(request) }
        
        if result == nil {
            
            print(request.route.uri)
            
            result = HTTPResponse(status: .notFound,
                                                   headers: [.contentType(.html)],
            body: """
                  <htlm>
                  <body>
                  <h1>NOT FOUND</h1>
                  </body>
                  </html>
                  """)
                     }
        return result
    }
}

