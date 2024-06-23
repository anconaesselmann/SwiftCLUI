// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SwiftCLUI",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftCLUI",
            targets: ["SwiftCLUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pakLebah/ANSITerminal", from: "0.0.3")
    ],
    targets: [
        .target(
            name: "SwiftCLUI",
            dependencies: ["ANSITerminal"]
        ),
        .testTarget(
            name: "SwiftCLUITests",
            dependencies: ["SwiftCLUI"]),
    ]
)
