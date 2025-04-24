//
//  NavigationBarView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-23.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        //NavigationStack {
            
   
            VStack{
                Spacer()
                
                Rectangle()
                    .cornerRadius(34)
                    .frame(width: 340, height: 80)
                    .foregroundColor(Color.white)
                    .opacity(0.4)
                    .overlay(
                        HStack {
                        
                           
                            NavigationLink(destination: HomeView())
                            {
                                Image(systemName: "house.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.green)
                            }
                            
                            
                            
                            
                        }
                    )
                // .padding(.bottom, 15)
                
                
            }
            
            
      //  }
    }
}

#Preview {
    NavigationBarView()
}
