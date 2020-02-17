// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "KeychainKit",
    products: [
        .library(
            name: "KeychainKit",
            targets: ["KeychainKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "KeychainKit",
            dependencies: []),
        .testTarget(
            name: "KeychainKitTests",
            dependencies: ["KeychainKit"]),
    ]
)
