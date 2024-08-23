import Foundation

struct FileManagerUtil {
    static func savePasswordsToFile(passwords: [PasswordItem]) -> URL? {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(passwords) else { return nil }

        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileURL = documentsDirectory?.appendingPathComponent("passwords.json")

        do {
            try data.write(to: fileURL!)
            return fileURL
        } catch {
            print("Failed to save file: \(error)")
            return nil
        }
    }

    static func loadPasswordsFromFile(url: URL) -> [PasswordItem]? {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: url)
            let passwords = try decoder.decode([PasswordItem].self, from: data)
            return passwords
        } catch {
            print("Failed to load file: \(error)")
            return nil
        }
    }
}
