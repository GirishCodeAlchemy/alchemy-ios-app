import SwiftUI

struct MainView: View {
//    @State private var passwords: [PasswordItem] = loadPasswords()
    @State private var passwords: [PasswordItem] = []
    @State private var searchText: String = ""
    var body: some View {
        NavigationView {
            List(filteredPasswords, id: \.id) { password in
                NavigationLink(destination: DetailView(passwordItem: password)) {
                    Text(password.title)
                }
            }
            .navigationTitle("Passwords")
            .navigationBarItems(trailing: Button(action: {
                navigateToCreateView()
            }) {
                Image(systemName: "plus")
            })
            .onAppear {
                loadPasswords()
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        searchPasswords()
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                }
            }
        }
    }

//    func loadPasswords() -> [PasswordItem] {
    func loadPasswords() {
        let fileManager = PasswordFileManager()
        let encryptionUtils = EncryptionUtils()

        do {
            if let encryptedData = fileManager.readPasswordsFile() {
                let decryptedData = try encryptionUtils.decrypt(data: encryptedData)
                let decoder = JSONDecoder()
                passwords = try decoder.decode([PasswordItem].self, from: decryptedData)
            }
        } catch {
            print("Failed to load or decrypt passwords: \(error.localizedDescription)")
        }
    }

    var filteredPasswords: [PasswordItem] {
        if searchText.isEmpty {
            return passwords
        } else {
            return passwords.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func navigateToCreateView() {
        // Navigation logic
    }

    func searchPasswords() {
        // Implement search functionality
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
