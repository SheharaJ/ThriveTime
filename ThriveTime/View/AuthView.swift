//
//  AuthView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-24.
//


import Foundation
import SwiftUI


extension Color {
    static let mainBlack = Color.black
    static let mainPurple = Color.purple
    static let lightPurple = Color(red: 0.8, green: 0.7, blue: 1.0)
    static let pink = Color.pink
    static let textWhite = Color.white
    
}


struct SignupView: View {
    @Environment(\.dismiss) var dismiss
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        ZStack{
            VStack(spacing: 20) {
                Spacer()
                HStack{
                Text("Let's Join")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    Text("Focus")
                        .font(.title)
                        .foregroundColor(.lightPurple)
                        .fontWeight(.semibold)

                    Spacer()
            }
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.purple, lineWidth: 6)
                        .background(Color.mainBlack.opacity(0.6))
                        .cornerRadius(10)

                    TextField("", text: $username, prompt: Text("Your Name").foregroundColor(.white))
                        .opacity(0.8)
                        .padding()
                        .foregroundColor(.textWhite)
                }
                .frame(height: 40)
                .padding(.top,10)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.purple, lineWidth: 6)
                        .background(Color.mainBlack.opacity(0.6))
                        .cornerRadius(10)

                    TextField("", text: $email, prompt: Text("Your Email").foregroundColor(.white))
                        .opacity(0.8)
                        .padding()
                        .foregroundColor(.textWhite)
                }
                .frame(height: 40)
                .padding(.top,10)

                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.purple, lineWidth: 6)
                        .background(Color.mainBlack.opacity(0.6))
                        .cornerRadius(10)

                    SecureField("", text: $password, prompt: Text("Enter Password").foregroundColor(.white))
                        .opacity(0.8)
                        .padding()
                        .foregroundColor(.textWhite)
                }
                .frame(height: 40)
                .padding(.top,10)
                
                Button(action: {}) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .font(.title3)
                        .padding()
                        .background(Color.mainPurple)
                        .foregroundColor(.textWhite)
                        .cornerRadius(10)
                }
                Spacer()
                
                
                Button("Already have an account? Log In") {
                    dismiss()
                }
                .foregroundColor(.lightPurple)
                
            }
        }
        .padding(20)
        .frame(maxHeight: .infinity)
        .background(Color.mainBlack)
        .ignoresSafeArea()
    }
}

#Preview(body: {
    SignupView()
    
})
