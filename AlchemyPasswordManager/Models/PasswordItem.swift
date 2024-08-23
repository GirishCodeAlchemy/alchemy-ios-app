import Foundation

struct PasswordItem: Identifiable, Codable {
    let id: UUID
    let title: String
    let username: String
    let password: String
    let note: String

    init(title: String, username: String, password: String, note: String) {
        self.id = UUID()
        self.title = title
        self.username = username
        self.password = password
        self.note = note
    }
}
