// swift-tools-version: 5.10

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
    dependencies: [
        .package(url: "git@github.com:apple/swift-testing.git", .upToNextMajor(from: "0.8.0")),
    ],
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
                .product(name: "Testing", package: "swift-testing"),
            ]
        ),
    ]
)
