//
//  HamburgerButtonView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-22.
//

import SwiftUI

struct HamburgerButtonView: View {
    @ObservedObject var viewModel: MenuViewModel
    
    
    var body: some View {
        
        
        
        
        Button(action: {
            viewModel.toggleMenu()
        }) {
            VStack(spacing: 4) {
                Rectangle()
                    .frame(width: 32, height: 3)
                Rectangle()
                    .frame(width: 22, height: 3)
                Rectangle()
                    .frame(width: 22, height: 3)
            }
            .foregroundColor(.white)
            .padding(12)
            //.background(Color.blue.opacity(0.7))
            .cornerRadius(8)
        }
        
        
        
        
    }
}

#Preview {
   // HamburgerButtonView()
}
