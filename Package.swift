
// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Datasenses_iOS",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "",
            targets: ["Datasenses_iOS"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "Datasenses_iOS",
            url: "https://cdn.datasenses.io/Datasenses_iOS.xcframework.zip",
	    checksum: "99e9ec8951ee3c4479aee456ca69251bcf9b9b405593277ab46dd8dafbccb377"
        ),
        
    ],
    swiftLanguageVersions: [.v5]
)
