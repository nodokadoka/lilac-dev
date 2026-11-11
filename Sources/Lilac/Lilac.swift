// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArgumentParser
import Foundation
import LilacConfig

#if canImport(System)
    import System
#else
    import SystemPackage
#endif

protocol LilacParsableCommand: AsyncParsableCommand {}

@main
struct Lilac: LilacParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "",
        subcommands: [
            InitCommand.self,
            UseCommand.self,
            StatusCommand.self,
            UseCommand.self,
        ]
    )

    mutating func run() async throws {
        let configPath = lilacConfigPath.absolutePath
        print("config path: ", configPath.string)
        let configData = try readConfig(from: configPath)
        let config = try parseConfig(from: configData)
        print(config)
    }
}
