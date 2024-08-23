//
//  PasswordFileManager.swift
//  AlchemyPasswordManager
//
//  Created by Girish on 23/08/24.
//

import Foundation

class PasswordFileManager {
    private let fileName = "passwords.json"
    
    // Read the encrypted passwords from the file
    func readPasswordsFile() -> Data? {
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        return try? Data(contentsOf: fileURL)
    }
    
    // Save encrypted passwords to the file
    func savePasswordsFile(data: Data) {
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        try? data.write(to: fileURL)
    }
    
    private func getDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
