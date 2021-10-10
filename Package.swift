// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "CIFilterExtension",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_11),
    ],
    products: [
        .library(name: "CIFilterExtension", targets: ["CIFilterExtension"]),
    ],
    targets: [
        .target(
            name: "CIFilterExtension",
            dependencies: [],
            path: "Sources"
        ),
    ]
)
