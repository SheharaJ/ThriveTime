//
//  ThriveTimeApp.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-10.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth



@main
struct ThriveTimeApp: App {
    init() {
            FirebaseApp.configure()
        }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
