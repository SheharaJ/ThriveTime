//
//  FriendExploreView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-26.
//

import Foundation
import SwiftUI

struct FriendExploreView: View {
    
    
    
    let potentialFriends: [AppUser] = [
        AppUser(name: "Alex", imageName: "memoji_1", totalTime: 150, averageTime: 120, isFriend: false),
        AppUser(name: "Bailey", imageName: "memoji_2", totalTime: 200, averageTime: 180, isFriend: false),
        AppUser(name: "Charlie", imageName: "memoji_3", totalTime: 100, averageTime: 90, isFriend: false),
        AppUser(name: "Dylani", imageName: "memoji_4", totalTime: 250, averageTime: 220, isFriend: false),
        AppUser(name: "Elliot", imageName: "memoji_5", totalTime: 180, averageTime: 160, isFriend: false),
        AppUser(name: "Ales", imageName: "memoji_1", totalTime: 150, averageTime: 120, isFriend: false),
        AppUser(name: "Bailey", imageName: "memoji_2", totalTime: 200, averageTime: 180, isFriend: false),
        AppUser(name: "Charlie", imageName: "memoji_3", totalTime: 100, averageTime: 90, isFriend: false),
        AppUser(name: "Dylani", imageName: "memoji_4", totalTime: 250, averageTime: 220, isFriend: false),
        AppUser(name: "Elliot", imageName: "memoji_5", totalTime: 180, averageTime: 160, isFriend: false)
    ]
    
    var body: some View {
        ZStack {
            Color.init(hex: "#1A1A1D").ignoresSafeArea()
            VStack {
                HStack {
                    Text("TriveTime")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.lightPurple)
                        .padding(.top, 10)
                    Text("Explore Friends")
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
                        ForEach(0..<potentialFriends.count / 2, id: \.self) { index in
                            HStack {
                                FriendCard(friend: potentialFriends[index * 2])
                                FriendCard(friend: potentialFriends[index * 2 + 1])
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct FriendCard: View {
    let friend: AppUser
    let ranClors : [Color] = [ .red , .orange , .green , .blue , .yellow , .pink , .brown ]

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.mainPurple)
                
                VStack {
                    ZStack {
                        Circle()
                            .fill(ranClors.randomElement() ?? .purple)
                            .frame(width: 90, height:90)
                        
                        Image(friend.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    }
                    .padding(.top)

                    
                    Text(friend.name)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 5)
                    
                    Button(action: {
                        
                    }) {
                        HStack{
                            Spacer()
                            Text("Add Friend")
                                .font(.system(size: 14, weight: .semibold, design: .rounded))
                                .foregroundColor(.white)
                                .padding(8)
                                .padding(.vertical, 3)
                            Spacer()
                        }
                        .background(Color.mainPurple)
                        .cornerRadius(100)
                        .padding()
                    }
                }
            }
        }
        .padding(10)
    }
}

#Preview {
    FriendExploreView()
}
