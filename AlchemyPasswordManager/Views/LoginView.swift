import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isAuthenticated: Bool = false

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .background(Color(.secondarySystemBackground))

            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))

            Button(action: authenticateUser) {
                Text("Login")
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            NavigationLink(
                destination: MainView(),
                isActive: $isAuthenticated,
                label: {
                    EmptyView()
                })
        }
        .padding()
    }

    func authenticateUser() {
        // Simulate authentication (Replace with real authentication logic)
        if !username.isEmpty && !password.isEmpty {
            isAuthenticated = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//import SwiftUI
//
//struct LoginView: View {
//    @State private var username: String = ""
//    @State private var password: String = ""
//    @State private var isLoginSuccessful: Bool = false
//    @State private var showAlert: Bool = false
//
//    var body: some View {
//        VStack {
//            TextField("Username", text: $username)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//
//            SecureField("Password", text: $password)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//
//            Button("Login") {
////                Text("Login")
////                    .frame(width: 200, height: 50)
////                    .background(Color.blue)
////                    .foregroundColor(.white)
////                    .cornerRadius(10)
//                if validateCredentials(username: username, password: password) {
//                    isLoginSuccessful = true
//                } else {
//                    showAlert = true
//                }
//            }
//            .padding()
//            .alert(isPresented: $showAlert) {
//                Alert(title: Text("Invalid Login"), message: Text("Please check your credentials"), dismissButton: .default(Text("OK")))
//            }
//
//            NavigationLink(destination: MainView(), isActive: $isLoginSuccessful) {
//                EmptyView()
//            }
//        }
//        .padding()
//    }
//
//    func validateCredentials(username: String, password: String) -> Bool {
//        guard let storedPasswordData = KeychainManager.load(key: username) else {
//            return false
//        }
//        let encryptionUtils = EncryptionUtils()
//        if let storedPassword = encryptionUtils.decryptString(storedPasswordData) {
//            return password == storedPassword
//        }
//        return false
//    }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
