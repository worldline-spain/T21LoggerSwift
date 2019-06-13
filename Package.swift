// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "T21Logger",
    products: [
        .library(
            name: "T21Logger",
            targets: ["T21Logger"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", from: "1.7.0"),
    ],
    targets: [
        .target(
            name: "T21Logger",
            dependencies: ["SwiftyBeaver"],
            path: "./src"),
    ]
)
