//
//  LoginViewModel.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-11.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject{
    
    @Published var email: String = ""
    @Published var password: String=""
   // @Published var user = User()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    
    
        // Simulate a login request
    func login() {
        isLoading = true
        errorMessage = nil
        
        // Simulate network call delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if self.email == "sheharajaya7@gmail.com" && self.password == "password" {
                // Successful login
                self.isLoading = false
            } else {
                // Error in login
                self.errorMessage = "Invalid credentials"
                self.isLoading = false
            }
        }
        
    }
}
