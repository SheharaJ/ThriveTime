//
//  AuthView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-24.
//

import Foundation
import SwiftUI

// MARK: - Colors Extension
extension Color {
    static let mainBlack = Color.black
    static let mainPurple = Color.purple
    static let lightPurple = Color(red: 0.8, green: 0.7, blue: 1.0)
    static let pink = Color.pink
    static let textWhite = Color.white
}

// MARK: - Splash View
struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            LoginView()
        } else {
            VStack {
                Spacer()
                HStack(spacing:2){
                    Text("Focus")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.lightPurple)
                    Text(".")
                    
                        .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top,-12)
                }
                Spacer()

                HStack{
                    Spacer()
                    Text("Lets forcus the with friends")
                        .font(.system(size: 15))
                        .opacity(0.8)
                        .fontWeight(.regular)
                        .foregroundColor(.lightPurple)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.mainBlack)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

// MARK: - Login View
struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isSignupPresented = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            HStack{
            Text("Login with")
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
                    .stroke(Color.purple, lineWidth: 1)
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
                    .stroke(Color.purple, lineWidth: 1)
                    .background(Color.mainBlack.opacity(0.6))
                    .cornerRadius(10)

                SecureField("", text: $password, prompt: Text("Your Email").foregroundColor(.white))
                    .opacity(0.8)
                    .padding()
                    .foregroundColor(.textWhite)
            }
            .frame(height: 40)
            .padding(.top,10)

            Button(action: {}) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.mainPurple)
                    .foregroundColor(.textWhite)
                    .cornerRadius(10)
            }
            Spacer()
            Button("Don't have an account? Sign Up") {
                isSignupPresented = true
            }
            .foregroundColor(.lightPurple)
            .sheet(isPresented: $isSignupPresented) {
                SignupView()
            }

        }
        .padding(20)
        .frame(maxHeight: .infinity)
        .background(Color.mainBlack)
        .ignoresSafeArea()
    }
}

// MARK: - Signup View
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
                        .stroke(Color.purple, lineWidth: 1)
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
                        .stroke(Color.purple, lineWidth: 1)
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
                        .stroke(Color.purple, lineWidth: 1)
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
