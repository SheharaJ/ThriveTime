//
//  ContentView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-10.
//

import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated = false

    var body: some View {
        ZStack {
            if isAuthenticated {
                MainTabView()
            } else {
                SplashScreenView()
                    
            }
        }
    }
}

#Preview {
    ContentView()
}




struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            FriendsView()
                .tabItem {
                    Label("Friends", systemImage: "person.2.fill")
                }

            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
        .navigationBarBackButtonHidden(true)
        .accentColor(.lightPurple)
    }
}
