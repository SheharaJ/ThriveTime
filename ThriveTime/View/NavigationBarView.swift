//
//  NavigationBarView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-23.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        
        
        
        TabView {
            // Home Tab
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            LoginView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            
            
        }
        .cornerRadius(45)
        //.shadow(radius: 50)
        .background(Color.white.opacity(0.6))
        
        
        
        
    }
}

#Preview {
    NavigationBarView()
}
