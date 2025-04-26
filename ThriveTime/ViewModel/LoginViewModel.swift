//
//  LoginViewModel.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-11.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    @Published var isLoggedIn: Bool = false
    
    private var db = Firestore.firestore()
    
    func login() {
        isLoading = true
        errorMessage = ""
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error {
                    self.errorMessage = error.localizedDescription
                } else if let user = result?.user {
                    print("Login successful: \(user.email ?? "")")
                    self.isLoggedIn = true
                    self.checkAndCreateUserDocument(userId: user.uid)
                }
            }
        }
    }
    
    private func checkAndCreateUserDocument(userId: String) {
        let userRef = db.collection("users").document(userId)
        
        userRef.getDocument { document, error in
            if let document = document, document.exists {
                print("User document already exists.")
            } else {
                // Create user document with default values
                let newUser: [String: Any] = [
                    "name": "New User",          // You can customize or collect this later
                    "imageName": "default",
                    "totalTime": 0,
                    "averageTime": 0,
                    "isFriend": false
                ]
                
                userRef.setData(newUser) { error in
                    if let error = error {
                        print("Error creating user document: \(error)")
                    } else {
                        print("User document created for UID: \(userId)")
                    }
                }
            }
        }
    }
}
