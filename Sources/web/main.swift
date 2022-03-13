import libWeb

let server = Server(port: 8080, isLoggingEnabled: true, routeImpl: FileRouterImpl())

server[.GET, "/api/"] = HTTPResponse(status: .ok,
                                           headers: [.contentType(.html)],
    body: """
          <htlm>
          <body>
          <small>API not yet implemented<small>
          </body>
          </html>
          """
)


try server.syncStart()
