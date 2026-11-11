import Foundation
import LilacTOML

#if canImport(System)
    import System
#else
    import SystemPackage
#endif

package struct LilacConfig: Codable {
    package var title: String
    package var port: Int
    package var debug: Bool
}

package enum ConfigError: Error {
    case fileNotFound
}

extension FilePath {
    package var absolutePath: FilePath {
        var copy = self
        guard isRelative && self.starts(with: FilePath("~")) else {
            return self
        }
        _ = copy.removePrefix(FilePath("~"))
        let homePath = FileManager.default.homeDirectoryForCurrentUser.absoluteURL
            .standardizedFileURL.path(percentEncoded: false)
        let abs = FilePath(homePath + copy.string)
        return abs
    }
}

package let lilacConfigPath = FilePath("~/.config/lilac/config.lilac")

package func readConfig(from filePath: FilePath) throws -> String {
    let fd = try FileDescriptor.open(
        filePath, .readOnly,
        options: [.append, .create],
        permissions: .ownerRead
    )
    let content = try fd.closeAfter {
        let fileSize = try fd.seek(offset: 0, from: .end)
        try fd.seek(offset: 0, from: .start)
        var buffer = [UInt8](repeating: 0, count: Int(fileSize))
        let bytesRead = try buffer.withUnsafeMutableBytes { rawBuffer in
            try fd.read(into: rawBuffer)
        }
        return String(decoding: buffer.prefix(bytesRead), as: UTF8.self)
    }
    return content
}

package func parseConfig(from string: String) throws -> LilacConfig {
    let config = try TOML.decode(LilacConfig.self, from: string)
    return config
}
