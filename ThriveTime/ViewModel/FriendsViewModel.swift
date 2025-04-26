//
//  FriendsViewModel.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-26.
//

import Foundation
import FirebaseFirestore

class FriendViewModel: ObservableObject {
    @Published var allUsers: [AppUser] = []
    @Published var friends: [AppUser] = []
    @Published var potentialFriends: [AppUser] = []
    
    private var db = Firestore.firestore()
    
    init() {
        generateInitialUsersIfNeeded()
    }
    
    
    func fetchUsers() {
        db.collection("users").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents, error == nil else {
                print("Error fetching users: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            let users = documents.compactMap { doc -> AppUser? in
                try? doc.data(as: AppUser.self)
            }
            
            DispatchQueue.main.async {
                self.allUsers = users
                self.friends = users.filter { $0.isFriend }
                self.potentialFriends = users.filter { !$0.isFriend }
            }
        }
    }
    
    func addFriend(_ friend: AppUser) {
        guard let id = friend.id else { return }
        
        var updatedFriend = friend
        updatedFriend.isFriend = true
        
        do {
            try db.collection("users").document(id).setData(from: updatedFriend, merge: true)
            
            DispatchQueue.main.async {
                if let index = self.potentialFriends.firstIndex(where: { $0.id == id }) {
                    self.potentialFriends.remove(at: index)
                }
                
                self.friends.append(updatedFriend)
            }
            
        } catch {
            print("Failed to update friend: \(error)")
        }
    }
    
    func generateInitialUsersIfNeeded() {
        db.collection("users").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents, error == nil else {
                print("Error checking existing users: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if documents.isEmpty {
                self.createRandomUsers()
            } else {
                print("Users already exist. Skipping generation.")
            }
        }
    }
    
    private func createRandomUsers() {
        let names = [
            "Kavindu", "Nimali", "Sajith", "Ishara", "Dinithi", "Chamika", "Lahiru", "Sanduni",
            "Tharindu", "Sewwandi", "Kasun", "Harshani", "Janith", "Pavithra", "Nadeesha", "Vimukthi",
            "Hiruni", "Thilina", "Sachini", "Akila"
        ]
        
        let imageNames = (1...8).map { "memoji_\($0)" }
        
        for name in names.shuffled().prefix(20) {
            let user = AppUser(
                name: name,
                imageName: imageNames.randomElement() ?? "memoji_1",
                totalTime: Int.random(in: 100...600),
                averageTime: Int.random(in: 60...300),
                isFriend: false
            )
            
            do {
                _ = try db.collection("users").addDocument(from: user)
            } catch {
                print("Error adding user \(name): \(error)")
            }
        }
    }
    
}
