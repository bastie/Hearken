// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "web",
    products: [
        .library(name: "libWeb", targets: ["libWeb"]),
        .executable(name: "web", targets: ["web"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.19.0"),
    ],
    targets: [
        .target(name: "libWeb", dependencies: [
            .product(name: "NIOHTTP1", package: "swift-nio")
        ]),
        .target(name: "web", dependencies: ["libWeb"]),
    ]
)
