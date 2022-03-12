import Hearken

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

server[.POST, "/api/hello"] = { _ in
    .init(status: .ok,
          headers: [.contentType(.json)],
          body: """
                {
                    "hello": "world"
                }
                """)
}

try server.syncStart()
