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
      ],
    ),
    .library(
      name: "FunctionalProtocols",
      targets: ["FunctionalProtocols"],
    ),
    .library(
      name: "FunctionalExtensions",
      targets: ["FunctionalExtensions"],
    ),
    .library(
      name: "FunctionalUtilityTypes",
      targets: ["FunctionalUtilityTypes"],
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-docc-plugin.git", .upToNextMajor(from: "1.4.3")),
  ],
  targets: [
    .target(
      name: "FunctionalProtocols",
    ),
    .target(
      name: "FunctionalExtensions",
      dependencies: [
        "FunctionalProtocols",
      ],
    ),
    .target(
      name: "FunctionalUtilityTypes",
    ),
    .testTarget(
      name: "FunctionalTests",
      dependencies: [
        "FunctionalProtocols",
        "FunctionalExtensions",
        "FunctionalUtilityTypes",
      ],
    ),
  ],
)
