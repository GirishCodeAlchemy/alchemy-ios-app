import SwiftUI

struct DetailView: View {
    var passwordItem: PasswordItem

    var body: some View {
//        VStack(alignment: .leading) {
//            Text("Title: \(passwordItem.title)")
//            Text("Username: \(passwordItem.username)")
//            Text("Password: \(passwordItem.password)")
//            Text("Note: \(passwordItem.note)")
//        }
//        .padding()
//        .navigationTitle("Password Details")
        
        Form {
            Section(header: Text("Details")) {
                Text("Title: \(passwordItem.title)")
                Text("Username: \(passwordItem.username)")
                Text("Password: \(passwordItem.password)")
                Text("Note: \(passwordItem.note)")
            }
        }
        .navigationTitle(passwordItem.title)
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(passwordItem: PasswordItem(title: "Sample", username: "user", password: "pass", note: "Sample Note"))
    }
}
