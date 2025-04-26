//
//  AppUserModel.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-26.
//

import Foundation
import FirebaseFirestore

struct AppUser: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var imageName: String
    var totalTime: Int
    var averageTime: Int
    var isFriend: Bool
}

