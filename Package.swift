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
        .package(url: "https://github.com/pakLebah/ANSITerminal", from: "0.0.3"),
        .package(url: "https://github.com/anconaesselmann/Ansi256Color", from: "0.0.2")
//        .package(url: "../Ansi256Color", from: "0.0.2")
    ],
    targets: [
        .target(
            name: "SwiftCLUI",
            dependencies: ["ANSITerminal", "Ansi256Color"]
        ),
        .testTarget(
            name: "SwiftCLUITests",
            dependencies: ["SwiftCLUI"]),
    ]
)
