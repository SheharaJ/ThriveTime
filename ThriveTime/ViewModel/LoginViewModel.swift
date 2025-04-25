//
//  LoginViewModel.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-11.
//

import Foundation
import Combine
import FirebaseAuth

class LoginViewModel: ObservableObject{
    
    @Published var email: String = ""
    @Published var password: String=""
    @Published var isLoading: Bool = false
    //@Published var errorMessage: String? = nil
    @Published var errorMessage: String = ""
    @Published var isLoggedIn: Bool = false
    
    
    func login() {
        isLoading = true
        //  errorMessage = nil
        errorMessage = ""
        
        
        
        
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        //            if self.email == "sheharajaya7@gmail.com" && self.password == "password" {
        //                // Successful login
        //                self.isLoggedIn = true
        //                self.isLoading = false
        //            } else {
        //                // Error in login
        //                self.errorMessage = "Invalid credentials"
        //                self.isLoading = false
        //            }
        //        }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    self.errorMessage = error.localizedDescription
                } else {
                    print("Login successful: \(result?.user.email ?? "")")
                    self.isLoggedIn = true 
                }
            }
            
        }
    }
}
