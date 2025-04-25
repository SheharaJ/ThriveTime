//
//  ProfileView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-26.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            Image("memoji_1")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray.opacity(0.3), lineWidth: 2))

            Text("Shehara")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(.white)

            Text("shehara@example.com")
                .font(.system(size: 16, weight: .regular, design: .rounded))
                .foregroundColor(.gray)

            Spacer()

            Button(action: {
                logout()
            }) {
                HStack {
                    Image(systemName: "arrow.backward.square.fill")
                        .font(.title2)
                    Text("Logout")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .cornerRadius(15)
                .padding(.horizontal, 30)
            }

            Spacer()
        }
        .padding(.top, 60)
        .background(Color(hex: "#1A1A1D").ignoresSafeArea())
    }

    func logout() {
        isLoggedIn = false
    }
}

#Preview {
    ProfileView()
}
