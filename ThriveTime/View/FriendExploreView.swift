//
//  FriendExploreView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-26.
//

import Foundation
import SwiftUI

struct FriendExploreView: View {
    
    @StateObject var viewModel = FriendViewModel()

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
                            ForEach(0..<viewModel.allUsers.count / 2, id: \.self) { index in
                                HStack {
                                    FriendCard(friend: viewModel.allUsers[index * 2], viewModel: viewModel)
                                    FriendCard(friend: viewModel.allUsers[index * 2 + 1], viewModel: viewModel)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }.onAppear {
                viewModel.fetchUsers()
            }
           
        }
        
}

struct FriendCard: View {
    let friend: AppUser
    @ObservedObject var viewModel: FriendViewModel
    @State private var added = false

    let ranClors: [Color] = [.red, .orange, .green, .blue, .yellow, .pink, .brown]

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.mainPurple)

                VStack {
                    ZStack {
                        Circle()
                            .fill(ranClors.randomElement() ?? .purple)
                            .frame(width: 90, height: 90)

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
                        viewModel.addFriend(friend)
                        added = true
                        NotificationManager.shared.scheduleNotification(
                            title: "\(friend.name) is now frined",
                            body: "Stay focused — with \(friend.name) :)"
                        )
                    }) {
                        HStack {
                            Spacer()
                            Text(added ? "Friends" : "Add Friend")
                                .font(.system(size: 14, weight: .semibold, design: .rounded))
                                .foregroundColor(.white)
                                .padding(8)
                                .padding(.vertical, 3)
                            Spacer()
                        }
                        .background(added ? Color.lightPurple : Color.mainPurple)
                        .cornerRadius(100)
                        .padding()
                    }
                    .disabled(added)
                }
            }
        }
        .padding(10)
    }
}


#Preview {
    FriendExploreView()
}
