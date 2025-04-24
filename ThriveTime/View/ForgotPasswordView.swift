//
//  ForgotPasswordView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-21.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    
    @StateObject  var forgotpasswordviewModel = ForgotPasswordViewModel()
    
    var body: some View {
        
        
        VStack(spacing: 24){
            
            
            Text("Forgot Password")
            // .font(.custom("Afacad", size: 40))
                .font(.largeTitle)
            
            Text("Email")
                .font(.title2)
            
            
            TextField("Email", text: $forgotpasswordviewModel.email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(12)
                .frame(width: 340)
            //.padding(38)
            
            
            
            
//            
//            Button(action:
//                    {
//                forgotpasswordviewModel.login()
//                
//            })
//            {
//                Text(viewModel.isLoading ? "Logging in..." : "Login")
//                    .foregroundColor(.white)
//                    .frame(width: 340)
//                    .padding()
//                    .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), startPoint: .leading, endPoint: .trailing))
//                    .cornerRadius(18)
//            }
//            .disabled(viewModel.isLoading)
//            //.padding(.bottom, 13)
            
            
            
        }
        
        
        
        
    }
}

#Preview {
    ForgotPasswordView()
}
