// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Scope",
    products: [
        .library(
            name: "Scope",
            targets: ["Scope"]
        ),
        .library(
            name: "Scope-dynamic",
            type: .dynamic,
            targets: ["Scope"]
        ),
    ],
    targets: [
        .target(name: "Scope"),
    ]
)
