package import Foundation
import TOML

package enum TOML {

    package static func decode<T: Decodable>(_ type: T.Type, from string: String) throws -> T {
        let decoder = TOMLDecoder()
        return try decoder.decode(type, from: string)
    }

    package static func encode<T: Encodable>(_ value: T) throws -> Data {
        let encoder = TOMLEncoder()
        return try encoder.encode(value)
    }
}
