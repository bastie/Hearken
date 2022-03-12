import libWeb

let server = Server(port: 8080, isLoggingEnabled: true)

server[.GET, "/api/health"] = HTTPResponse(status: .ok,
                                           headers: [.contentType(.html)],
    body: """
          <htlm>
          <body>
          <h1>TEST</h1>
          </body>
          </html>
          """
)


try server.syncStart()
