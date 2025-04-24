//
//  HomeView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-21.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State private var isRunning = false
    @State private var time = "00:00"
    @State private var selectedMemoji = "memoji_1"
    @State private var showMemojiPicker = false


    var body: some View {
        ZStack {
            Color.init(hex: "#1A1A1D").ignoresSafeArea()
            VStack(spacing: 30) {
                Spacer()
                Text("Shehara")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
               
                ZStack {
                    
                  
                    Circle()
                        .stroke(Color.lightPurple, lineWidth: 2)
                        .frame(width: 290, height: 290)
                        .opacity(0.4)
                    Circle()
                        .stroke(Color.lightPurple, lineWidth: 5)
                        .frame(width: 270, height: 270)
                        .opacity(0.6)
                    Circle()
                        .fill(.purple)
                        .frame(width: 250, height: 250)
                    
                    Image(selectedMemoji)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 220)
                   

                }
                
                ZStack {
                    Circle()
                        .fill(Color.lightPurple)
                        .frame(width: 60, height: 60)

                    Image(systemName: "camera")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .fontWeight(.bold)
                }
                .onTapGesture {
                    showMemojiPicker = true
                }
                .padding(.top, -70)



                // Show Time
                Text(time)
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack{
                    Text("Joined people")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                    Text("+ Invite")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .foregroundColor(.lightPurple)
                }
                .padding(.horizontal,20)
                .padding(.bottom,-10)

                ScrollView(.horizontal){
                    HStack(spacing:20){
                        
                        FriendItemView(color: .orange, name: "Ales")
                        FriendItemView(color: .blue, name: "Bailey")
                        FriendItemView(color: .green, name: "Charlie")
                        FriendItemView(color: .pink, name: "Dylani")
                        FriendItemView(color: .yellow, name: "Elliot")
                        FriendItemView(color: .orange, name: "Fxinley")
                        FriendItemView(color: .blue, name: "Gray")
                        FriendItemView(color: .green, name: "Harper")
                        FriendItemView(color: .pink, name: "Indigo")
                        FriendItemView(color: .yellow, name: "Jules")
                        FriendItemView(color: .orange, name: "Kais")
                        FriendItemView(color: .blue, name: "Logana")
                        FriendItemView(color: .green, name: "Morgan")
                        FriendItemView(color: .pink, name: "Nova")
                        FriendItemView(color: .yellow, name: "Quinn")
                        Spacer()
                        
                    }
                }
                .padding(.horizontal,20)


                // Buttons
                VStack{
                    HStack(spacing: 40) {
                        Button(action: {
                            isRunning.toggle()
                        }) {
                            Spacer()
                            Image(systemName: "timer")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            Text(isRunning ? "Pause Time" : "Start Timer")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)

                            Spacer()
                        }
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(15)
                        .padding(.horizontal,20)

                    }
                    .frame(maxWidth: .infinity)
                    
                }
            }
            .sheet(isPresented: $showMemojiPicker) {
                MemojiPicker(selectedMemoji: $selectedMemoji, showMemojiPicker: $showMemojiPicker)
                    .presentationDetents([.height(150)])
            }


        }
    }
}

#Preview {
    HomeView()
}


struct FriendItemView : View {
    let color : Color
    let name : String
    var body: some View {
        VStack{
            ZStack {
                Circle()
                    .fill(color)
                    .frame(width: 70, height: 70)
                
                Image("memoji_1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 65, height: 65)
            }
            
            Text(name)
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .foregroundColor(.white)
                .opacity(0.5)
                .padding(.top,6)
        }
    }
}


struct MemojiPicker: View {
    @Binding var selectedMemoji: String
    @Binding var showMemojiPicker: Bool

    let memojis = ["memoji_1", "memoji_2", "memoji_3", "memoji_4", "memoji_5", "memoji_6", "memoji_7", "memoji_8"]

    var body: some View {
        VStack(spacing: 20) {
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(memojis, id: \.self) { memoji in
                        Image(memoji)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .onTapGesture {
                                selectedMemoji = memoji
                                showMemojiPicker = false // Dismiss the sheet
                            }
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray.opacity(0.4), lineWidth: 2))
                    }
                }
                .padding(.top)
                .padding()
            }

            Spacer()
        }
        .background(Color(hex: "#000000"))
    }
}


extension Color {
    static let sheetBackground = Color(hex: "#3D365C")
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#") // skip #
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(.sRGB, red: r, green: g, blue: b)
    }
}
