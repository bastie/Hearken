import libWeb

var IP = "localhost"
var port = 8080

var offset = 0
for value in CommandLine.arguments {
    switch (value) {
    case "-h": fallthrough
    case "--help":
        print ("usage \(CommandLine.arguments[0]) [[IP] | IP [Port]]")
        break
    default:
        break
    }
    
    switch offset {
    case 1:
        IP = value
    case 2:
        port = Int(value)!
    default:
        break
    }
    offset += 1
}

let server = Server(ip: IP, port: port, isLoggingEnabled: false, routeImpl: FileRouterImpl())

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
