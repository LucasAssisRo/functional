// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Functional",
    products: [
        .library(
            name: "Functional",
            targets: [
                "Functional",
                "FunctionalExtensions",
                "FunctionalUtilityTypes",
            ]
        ),
        .library(
            name: "FunctionalProtocols",
            targets: ["Functional"]
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
            name: "Functional"
        ),
        .target(
            name: "FunctionalExtensions",
            dependencies: [
                "Functional",
            ]
        ),
        .target(
            name: "FunctionalUtilityTypes"
        ),
        .testTarget(
            name: "FunctionalTests",
            dependencies: [
                "Functional",
                "FunctionalExtensions",
                "FunctionalUtilityTypes",
                .product(name: "Testing", package: "swift-testing"),
            ]
        ),
    ]
)
