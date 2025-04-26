//
//  StatsViewModel.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-26.
//

import Foundation
import FirebaseFirestore

class StatsViewModel: ObservableObject {
    @Published var currentUser: AppUser = AppUser(name: "You", imageName: "memoji_1", totalTime: 320, averageTime: 240, isFriend: false)
    @Published var friends: [AppUser] = []
    @Published var allUsers: [AppUser] = []

    private var db = Firestore.firestore()

    func fetchData() {
        db.collection("users").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }

            let users = documents.compactMap { try? $0.data(as: AppUser.self) }

            DispatchQueue.main.async {
                self.friends = users.filter { $0.isFriend }
                self.allUsers = users
            }
        }
    }
}
