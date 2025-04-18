// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExifTool",
    platforms: [
        .macOS(.v11),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ExifTool",
            targets: ["ExifTool"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "XMLDocument", url: "https://github.com/hlemai/XMLDocument.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "ExifTool",
            dependencies: [
                .productItem(name: "XMLDocument", package: "XMLDocument", condition: .when(platforms: [.iOS]))
            ]),
        .testTarget(
            name: "ExifToolTests",
            dependencies: ["ExifTool"],
            resources: [
                .copy("Resources")
            ])
    ]
)
