//
//  UserViewModel.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-26.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class UserViewModel: ObservableObject {
    @Published var currentUser: AppUser?
    private var db = Firestore.firestore()
    
    private var userId: String? {
        Auth.auth().currentUser?.uid
    }

    func fetchUser() {
        guard let userId = userId else {
            print("No user is logged in.")
            return
        }
        
        db.collection("users").document(userId).getDocument { document, error in
            if let document = document, document.exists {
                do {
                    self.currentUser = try document.data(as: AppUser.self)
                    print("Fetched user: \(self.currentUser?.name ?? "")")
                } catch {
                    print("Error decoding user: \(error)")
                }
            } else {
                print("User document does not exist.")
            }
        }
    }


    func addFocusTime(minutes: Int) {
        guard var user = currentUser else { return }
        guard let userId = userId else {
            print("No user is logged in.")
            return
        }

        user.totalTime += minutes
        self.currentUser = user

        do {
            try db.collection("users").document(userId).setData(from: user)
            print("Updated totalTime: \(user.totalTime)")
        } catch {
            print("Error updating user: \(error)")
        }
    }

}
