// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Chroma",
    products: [
        .library(
            name: "Chroma",
            targets: ["Chroma"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Chroma",
            dependencies: []
        ),
        .testTarget(
            name: "ApiTests",
            dependencies: ["Chroma"]
        ),
        .testTarget(
            name: "InternalTests",
            dependencies: ["Chroma"]
        ),
    ]
)
