// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SwiftenAI",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "SwiftenAI",
            targets: ["SwiftenAI"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/sbertix/ComposableRequest", .upToNextMinor(from: "7.0.0"))
    ],
    targets: [
        .target(
            name: "SwiftenAI",
            dependencies: [
                .product(name: "Requests", package: "ComposableRequest")
            ]
        ),
        .testTarget(
            name: "SwiftenAITests",
            dependencies: ["SwiftenAI"]
        )
    ]
)
