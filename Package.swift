// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Scope",
    products: [
        .library(
            name: "Scope",
            targets: ["Scope"]
        ),
    ],
    targets: [
        .target(name: "Scope")
    ]
)
