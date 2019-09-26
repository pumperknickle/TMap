// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TMap",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "TMap",
            targets: ["TMap"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pumperknickle/Bedrock.git", from: "0.0.3"),
        .package(url: "https://github.com/Quick/Quick.git", from: "2.1.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "TMap",
            dependencies: ["Bedrock"]),
        .testTarget(
            name: "TMapTests",
            dependencies: ["TMap", "Quick", "Nimble", "Bedrock"]),
    ]
)
