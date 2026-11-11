import ArgumentParser

struct StatusCommand: LilacParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "status",
        abstract: "",
        subcommands: []
    )

    mutating func run() async throws {
        print("status command")
    }
}
