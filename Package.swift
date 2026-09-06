// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "Functional",
    products: [
        .library(
            name: "Functional",
            targets: [
                "FunctionalProtocols",
                "FunctionalExtensions",
                "FunctionalUtilityTypes",
            ]
        ),
        .library(
            name: "FunctionalProtocols",
            targets: ["FunctionalProtocols"]
        ),
        .library(
            name: "FunctionalExtensions",
            targets: ["FunctionalExtensions"]
        ),
        .library(
            name: "FunctionalUtilityTypes",
            targets: ["FunctionalUtilityTypes"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FunctionalProtocols"
        ),
        .target(
            name: "FunctionalExtensions",
            dependencies: [
                "FunctionalProtocols",
            ]
        ),
        .target(
            name: "FunctionalUtilityTypes"
        ),
        .testTarget(
            name: "FunctionalTests",
            dependencies: [
                "FunctionalProtocols",
                "FunctionalExtensions",
                "FunctionalUtilityTypes",
            ]
        ),
    ]
)
