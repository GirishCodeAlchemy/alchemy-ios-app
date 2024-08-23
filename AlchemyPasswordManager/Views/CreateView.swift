import SwiftUI
struct CreateView: View {
    @State private var title: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var note: String = ""

    var body: some View {
        Form {
            Section(header: Text("Details")) {
                TextField("Title", text: $title)
                TextField("Username", text: $username)
                SecureField("Password", text: $password)
                TextField("Note", text: $note)
            }

            Button("Save") {
                savePassword()
            }
            .disabled(title.isEmpty || username.isEmpty || password.isEmpty)
        }
        .navigationTitle("New Password")
    }

    func savePassword() {
        let newPassword = PasswordItem(title: title, username: username, password: password, note: note)
        let fileManager = PasswordFileManager()
        let encryptionUtils = EncryptionUtils()

//        if let encryptedPassword = encryptionUtils.encryptString(password) {
//            KeychainManager.save(key: username, data: encryptedPassword)
//        }
        
        do {
            var existingPasswords = loadExistingPasswords() ?? []
            existingPasswords.append(newPassword)

            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(existingPasswords)
            let encryptedData = try encryptionUtils.encrypt(data: encodedData)

            fileManager.savePasswordsFile(data: encryptedData)
        } catch {
            print("Failed to save password: \(error.localizedDescription)")
        }
    }
    func loadExistingPasswords() -> [PasswordItem]? {
        let fileManager = PasswordFileManager()
        let encryptionUtils = EncryptionUtils()

        do {
            if let encryptedData = fileManager.readPasswordsFile() {
                let decryptedData = try encryptionUtils.decrypt(data: encryptedData)
                let decoder = JSONDecoder()
                return try decoder.decode([PasswordItem].self, from: decryptedData)
            }
        } catch {
            print("Failed to load existing passwords: \(error.localizedDescription)")
        }
        return nil
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
