// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "2222",
    platforms: [.macOS(.v11), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .executable(
            name: "2222",
            targets: ["2222"]),
        .executable(
            name: "2222app",
            targets: ["2222app"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "2222",
            resources: [
                .copy("2222.txt")
            ]),
        .executableTarget(
            name: "2222app",
            resources: [
                .copy("2222.txt")
            ]),
    ]
)
