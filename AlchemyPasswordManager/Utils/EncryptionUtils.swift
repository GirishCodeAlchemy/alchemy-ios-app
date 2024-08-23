import Foundation
import CryptoKit

struct EncryptionUtils {
    private let key = SymmetricKey(size: .bits256)

    func encryptData(_ data: Data) -> Data? {
        let sealedBox = try? ChaChaPoly.seal(data, using: key)
        return sealedBox?.combined
    }

    func decryptData(_ encryptedData: Data) -> Data? {
        guard let box = try? ChaChaPoly.SealedBox(combined: encryptedData) else { return nil }
        return try? ChaChaPoly.open(box, using: key)
    }

    func encryptString(_ string: String) -> Data? {
        guard let data = string.data(using: .utf8) else { return nil }
        return encryptData(data)
    }

    func decryptString(_ data: Data) -> String? {
        guard let decryptedData = decryptData(data) else { return nil }
        return String(data: decryptedData, encoding: .utf8)
    }
    
    // Replace with your own encryption logic
    func encrypt(data: Data) throws -> Data {
        // Example: Just return the data for now (no encryption)
        return data
    }
    
    func decrypt(data: Data) throws -> Data {
        // Example: Just return the data for now (no decryption)
        return data
    }
}
