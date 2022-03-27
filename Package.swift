// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "web",
    products: [
        .library(name: "libWeb", targets: ["libWeb"]),
        .executable(name: "web", targets: ["web"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.19.0"),
        .package(url: "https://github.com/bastie/Sword.git", .upToNextMajor(from: "0.1.2")),
    ],
    targets: [
        .target(name: "libWeb", dependencies: [
            .product(name: "NIOHTTP1", package: "swift-nio"),
            .product(name: "KnightLife", package: "Sword"),
        ]),
        .executableTarget(name: "web", dependencies: ["libWeb"]),
    ]
)
