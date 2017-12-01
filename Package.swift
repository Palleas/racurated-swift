// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "racurated-swift",
    dependencies: [
        .package(url: "git@github.com:kylef/Stencil.git", from: "0.10.1"),
        .package(url: "https://github.com/ReactiveCocoa/ReactiveSwift.git", from: "3.0.0"),
        .package(url: "git@github.com:mdiep/Tentacle.git", .branchItem("master")),
        .package(url: "git@github.com:JohnSundell/Files.git", from: "2.0.1")
    ],
    targets: [

        .target(
            name: "racurated-swift",
            dependencies: ["Stencil", "Tentacle", "ReactiveSwift", "Files"]),
    ]
)
