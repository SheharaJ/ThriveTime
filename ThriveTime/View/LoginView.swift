//
//  LoginView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var isSignupPresented = false
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            
            VStack(spacing: 20) {
                Spacer()
                VStack{
                    Text("Welcome!")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    Text("Login to your account")
                        .font(.title3)
                        .foregroundColor(.lightPurple)
                        .fontWeight(.semibold)
                    
                    // Spacer()
                }
                NavigationLink(destination: MainTabView(), isActive: $viewModel.isLoggedIn) {
                    EmptyView()
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.purple, lineWidth: 6)
                        .background(Color.mainBlack.opacity(0.6))
                        .cornerRadius(10)
                    
                    TextField("", text: $viewModel.email, prompt: Text(" Email").foregroundColor(.white))
                        .opacity(0.8)
                        .padding()
                        .foregroundColor(.textWhite)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                }
                .frame(width: 350, height: 40 )
                .padding(.top,10)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.purple, lineWidth: 6)
                        .background(Color.mainBlack.opacity(0.6))
                        .cornerRadius(10)
                    
                    SecureField("", text: $viewModel.password, prompt: Text("Password").foregroundColor(.white))
                        .opacity(0.8)
                        .padding()
                        .foregroundColor(.textWhite)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .frame(width: 350,height: 40)
                .padding(.top,10)
                
                
                Button(action: viewModel.login) {
                    
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .font(.title3)
                        .background(Color.mainPurple)
                        .foregroundColor(.textWhite)
                        .cornerRadius(10)
                }
                
                Spacer()
                Button("Don't have an account? Sign Up") {
                    isSignupPresented = true
                }
                
                .foregroundColor(.lightPurple)
                .font(.title3)
                .sheet(isPresented: $isSignupPresented) {
                    SignupView()
                }
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red.opacity(0.85))
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                        .padding(.horizontal)
                        .transition(.move(edge: .top).combined(with: .opacity))
                        .animation(.easeInOut, value: viewModel.errorMessage)
                    
                    
                }
                
            }
            .padding(20)
            .frame(maxHeight: .infinity)
            .background(Color.mainBlack)
            .ignoresSafeArea()
        }
    }
    
}

#Preview {
    LoginView()
}
