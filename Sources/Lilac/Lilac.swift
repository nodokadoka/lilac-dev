// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArgumentParser

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
        print("test")
    }
}
