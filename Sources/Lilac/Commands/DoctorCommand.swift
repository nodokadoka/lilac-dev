import ArgumentParser

struct DoctorCommand: LilacParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "doctor",
        abstract: "",
        subcommands: []
    )

    mutating func run() async throws {
        print("doctor command")
    }
}
