import Foundation
import TOML

public enum TOML {

    public static func decode<T: Decodable>(_ type: T.Type, from string: String) throws -> T {
        let decoder = TOMLDecoder()
        return try decoder.decode(type, from: string)
    }

    public static func encode<T: Encodable>(_ value: T) throws -> Data {
        let encoder = TOMLEncoder()
        return try encoder.encode(value)
    }
}
