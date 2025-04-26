//
//  StatsView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-26.
//


import SwiftUI


struct StatsView: View {
    @StateObject var viewModel = StatsViewModel()

    var body: some View {
        ZStack {
            Color(hex: "#1A1A1D").ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    HeaderTitle()
                    MyStatsCard()

                    SectionTitle(title: "🔥 Challenges")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ChallengeCard(title: "Focus 5 Days", progress: 3)
                            ChallengeCard(title: "100 Min Daily", progress: 2)
                        }
                        .padding(.horizontal)
                    }

                    SectionTitle(title: "🏆 Ranks")
                    VStack(spacing: 15) {
                        RankCard(title: "Friends Rank", users: viewModel.friends + [viewModel.currentUser])
                        RankCard(title: "All Users", users: viewModel.allUsers + [viewModel.currentUser])
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}


struct MyStatsCard: View {
    @StateObject private var userViewModel = UserViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let user = userViewModel.currentUser {
                HStack {
                    Image("memoji_1")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .padding(5)
                        .background(Circle().fill(Color.purple))
                    
                    VStack(alignment: .leading) {
                        Text("Shehara")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("Total: \(formatTime(user.totalTime))")
                            .foregroundColor(.white)
                        Text("Avg/Day: \(formatTime(user.averageTime))")
                            .foregroundColor(.white.opacity(0.8))
                    }
                    Spacer()
                }
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .purple))
            }
        }
        .padding()
        .background(Color.purple.opacity(0.3))
        .cornerRadius(15)
        .onAppear {
            userViewModel.fetchUser()
        }
    }

    func formatTime(_ mins: Int) -> String {
        let hrs = mins / 60
        let minsLeft = mins % 60
        return String(format: "%02d:%02d", hrs, minsLeft)
    }
}



struct ChallengeCard: View {
    let title: String
    let progress: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            ProgressView(value: Double(progress), total: 5)
                .accentColor(.green)
        }
        .padding()
        .frame(width: 160)
        .background(Color.blue.opacity(0.3))
        .cornerRadius(15)
    }
}

struct RankCard: View {
    let title: String
    let users: [AppUser]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            
            ForEach(users.sorted(by: { $0.totalTime > $1.totalTime }).prefix(5), id: \.name) { user in
                HStack {
                    Image(user.imageName)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(4)
                        .background(Circle().fill(Color.gray.opacity(0.2)))
                    
                    Text(user.name)
                        .foregroundColor(.white)
                    
                    Spacer()
                    Text(formatTime(user.totalTime))
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.vertical, 5)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
    }
    
    func formatTime(_ mins: Int) -> String {
        let hrs = mins / 60
        let minsLeft = mins % 60
        return String(format: "%02d:%02d", hrs, minsLeft)
    }
}

struct SectionTitle: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .bold()
            .foregroundColor(.lightPurple)
            .padding(.horizontal)
    }
}

struct HeaderTitle: View {
    
    
    var body: some View {
        HStack(spacing:0){
            Text("TriveTime")
                .font(.title2)
                .bold()
                .foregroundColor(.lightPurple)
            Text(" Stats")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
        }
        .padding(.horizontal)
    }
}

#Preview {
    StatsView()
}
