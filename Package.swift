// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "Hearken",
    products: [
        .library(name: "Hearken", targets: ["Hearken"]),
        .executable(name: "HearkenExample", targets: ["HearkenExample"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.19.0"),
    ],
    targets: [
        .target(name: "Hearken", dependencies: [
            .product(name: "NIOHTTP1", package: "swift-nio")
        ]),
        .target(name: "HearkenExample", dependencies: ["Hearken"]),
    ]
)
