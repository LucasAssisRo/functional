// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Functional",
    products: [
        .library(
            name: "Functional",
            targets: ["Functional"]
        ),
        .library(
            name: "FunctionalDynamic",
            type: .dynamic,
            targets: ["Functional"]
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
            name: "FunctionalExtensions"
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
