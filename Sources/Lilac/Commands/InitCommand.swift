import ArgumentParser

struct InitCommand: LilacParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "init",
        abstract: "",
        subcommands: []
    )

    mutating func run() async throws {
        print("init command")
    }
}
