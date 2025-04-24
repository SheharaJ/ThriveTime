//
//  HomeView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = MenuViewModel()
    @ObservedObject var timerviewModel = TimerViewModel()
    
    var body: some View {
        
        
        ZStack {
            
          
            
            Text(timerviewModel.formattedTime)
                          .font(.system(size: 70))
                          //.fontWeight(.bold)
                          .padding()
            
            
            
                }
        
        
        
        
    }
}

#Preview {
    HomeView()
}
