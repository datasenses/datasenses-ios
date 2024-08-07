import PackageDescription

let package = Package(
    name: "Datasenses_iOS",
    platforms: [
        .iOS(.v13) // Specify the minimum iOS version supported by your xcframework
    ],
    products: [
        .library(
            name: "Datasenses_iOS",
            targets: ["Datasenses_iOS"]),
    ],
    targets: [
        .binaryTarget(
            name: "Datasenses_iOS",
            path: "Sources/Datasenses_iOS/Datasenses_iOS.xcframework")
    ],
    swiftLanguageVersions: [.v5]
)
