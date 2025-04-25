//
//  FriendsView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-25.
//

import Foundation
import SwiftUI





struct FriendsView: View {
    
    let friends: [AppUser] = [
        AppUser(name: "Ales", imageName: "memoji_1", totalTime: 150, averageTime: 120, isFriend: true),
        AppUser(name: "Bailey", imageName: "memoji_2", totalTime: 200, averageTime: 180, isFriend: true),
        AppUser(name: "Charlie", imageName: "memoji_3", totalTime: 100, averageTime: 90, isFriend: true),
        AppUser(name: "Dylani", imageName: "memoji_4", totalTime: 250, averageTime: 220, isFriend: true),
        AppUser(name: "Elliot", imageName: "memoji_5", totalTime: 180, averageTime: 160, isFriend: true),
        AppUser(name: "Ales", imageName: "memoji_1", totalTime: 150, averageTime: 120, isFriend: true),
        AppUser(name: "Bailey", imageName: "memoji_2", totalTime: 200, averageTime: 180, isFriend: true),
        AppUser(name: "Charlie", imageName: "memoji_3", totalTime: 100, averageTime: 90, isFriend: true),
        AppUser(name: "Dylani", imageName: "memoji_4", totalTime: 250, averageTime: 220, isFriend: true),
        AppUser(name: "Elliot", imageName: "memoji_5", totalTime: 180, averageTime: 160, isFriend: true),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.init(hex: "#1A1A1D").ignoresSafeArea()
                VStack {
                    HStack {
                        Text("TriveTime")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(.lightPurple)
                            .padding(.top, 10)
                        Text("Friends")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.top, 10)
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    .padding(.bottom, -10)
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(friends, id: \.name) { friend in
                                FriendRow(friend: friend)
                            }
                        }
                        .padding()
                    }
                    
                    NavigationLink(destination: FriendExploreView()) {
                        HStack {
                            Spacer()
                            Image(systemName: "person.fill.badge.plus")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            Text("Add More Friends")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(15)
                        .padding(.horizontal, 20)
                    }
                    .frame(maxWidth: .infinity)
                    
                }
            }
        }
    }
}

struct FriendRow: View {
    let friend: AppUser
    
    var body: some View {
        HStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(Color.purple)
                    .frame(width: 70, height: 70)
                
                Image(friend.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 65, height: 65)
            }
            
            VStack(alignment: .leading) {
                Text(friend.name)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                HStack(spacing: 10) {
                    Text("Total Time: \(formatTime(friend.totalTime))")
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                    Text("Avg Time: \(formatTime(friend.averageTime))")
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
        }
        .padding(.vertical, 10)
    }
    
    func formatTime(_ minutes: Int) -> String {
        let hours = minutes / 60
        let mins = minutes % 60
        return String(format: "%02d:%02d", hours, mins)
    }
}

#Preview {
    FriendsView()
}
