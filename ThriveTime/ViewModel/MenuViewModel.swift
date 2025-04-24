//
//  MenuViewModel.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-22.
//

import Foundation
class MenuViewModel: ObservableObject {
    @Published var isMenuOpen = false
    
    func toggleMenu() {
        isMenuOpen.toggle()
    }
}
