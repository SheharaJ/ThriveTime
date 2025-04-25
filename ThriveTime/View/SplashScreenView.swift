//
//  SplashScreenView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        
        if isActive {
            LoginView()
        } else {
            VStack {
                Spacer()
                HStack(spacing:2){
                    Text("ThriveTime")
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
    //
    //#Preview {
    //    SplashScreenView()
    //}
    
    
    #Preview(body: {
        SplashScreenView()
        
    })

