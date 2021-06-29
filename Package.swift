// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Scope",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10),
        .watchOS(.v2),
        .tvOS(.v9),
    ],
    products: [
        .library(
            name: "Scope",
            targets: ["Scope"]
        ),
    ],
    targets: [
        .target(name: "Scope"),
    ]
)
