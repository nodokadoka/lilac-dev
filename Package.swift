// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let swiftSettings: [SwiftSetting] = [
    // https://github.com/apple/swift-evolution/blob/main/proposals/0335-existential-any.md
    .enableUpcomingFeature("ExistentialAny"),

    // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0444-member-import-visibility.md
    .enableUpcomingFeature("MemberImportVisibility"),

    // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0409-access-level-on-imports.md
    .enableUpcomingFeature("InternalImportsByDefault"),

    // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0461-async-function-isolation.md
    .enableUpcomingFeature("NonisolatedNonsendingByDefault"),

    // swift 6.4
    .enableUpcomingFeature("ApproachableConcurrency"),

    .strictMemorySafety(),

    .treatAllWarnings(as: .error)
]

let package = Package(
    name: "Lilac",
    platforms: [.macOS(.v27)],
    products: [
        .executable(name: "lilac", targets: ["Lilac"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.7.0"),
        .package(url: "https://github.com/mattt/swift-toml.git", from: "2.1.0"),
        .package(url: "https://github.com/apple/swift-system", from: "1.8.0"),
    ],
    targets: [
        .executableTarget(
            name: "Lilac",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "SystemPackage", package: "swift-system"),
                "LilacConfig",
            ],
            swiftSettings: swiftSettings,
        ),
        .target(
            name: "LilacConfig",
            dependencies: [
                "LilacTOML"
            ],
            swiftSettings: swiftSettings,
        ),
        .target(
            name: "LilacTOML",
            dependencies: [
                .product(name: "TOML", package: "swift-toml")
            ],
            swiftSettings: swiftSettings,
        ),
        .testTarget(
            name: "LilacTests",
            dependencies: ["Lilac"],
            swiftSettings: swiftSettings,
        ),
    ]
)
