// swift-tools-version: 5.7

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
        .target(name: "Scope"),
    ]
)
