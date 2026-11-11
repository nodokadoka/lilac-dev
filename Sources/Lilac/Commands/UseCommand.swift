import ArgumentParser

struct UseCommand: LilacParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "use",
        abstract: "",
        subcommands: []
    )

    @Argument(help: "Environment")
    var env: String

    mutating func run() async throws {}
}
