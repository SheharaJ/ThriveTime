//
//  HomeView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-21.
//

import Foundation
import SwiftUI
import AVKit
import UserNotifications


struct HomeView: View {
    @State private var isRunning = false
    @State private var time = "00:00"
    @State private var selectedMemoji = "girl_10"
    @State private var showMemojiPicker = false
    @State private var timer: Timer?
    @State private var secondsElapsed = 0
    @State private var memojiList = ["girl_10", "girl_9", "girl_8", "girl_7", "girl_6", "girl_5", "girl_4", "girl_3", "girl_2", "girl_1"]
    @State private var memjies = ["girl_10", "girl_9", "girl_8", "girl_7", "girl_6", "girl_5", "girl_4", "girl_3", "girl_2", "girl_1"]
    
    @State private var memojiIndex = 0
    
    
    
    var body: some View {
        ZStack {
            VStack() {
                Text("Shehara")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.top)
                HStack(spacing:0){
                    Text("Trive")
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundColor(.purple)
                    Text("Time")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                }
                Spacer()
                
                
                ZStack {
                    
                    
                    Circle()
                        .stroke(Color.lightPurple, lineWidth: 2)
                        .frame(width: 240, height: 240)
                        .opacity(0.4)
                    Circle()
                        .stroke(Color.lightPurple, lineWidth: 5)
                        .frame(width: 230, height: 230)
                        .opacity(0.6)
                    Circle()
                        .fill(.purple)
                        .frame(width: 210, height: 210)
                    
                    Image(selectedMemoji)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 170, height: 170)
                    
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
                .padding(.top, -50)
                
                Spacer()
                
                
                Text(time)
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                
                HStack{
                    Text("Joined people")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                    Text("+ Invite")
                        .font(.system(size: 15, weight: .regular, design: .rounded))
                        .foregroundColor(.lightPurple)
                }
                .padding(.horizontal,20)
                .padding(.vertical)
                
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
                
                
                VStack{
                    HStack(spacing: 40) {
                        Button(action: {
                            if isRunning {
                                self.resetTimer()
                            } else {
                                memojiIndex = 0
                                selectedMemoji = memojiList[memojiIndex]
                                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                                    secondsElapsed += 1
                                    time = formatTime(seconds: secondsElapsed)
                                    
                                    if secondsElapsed % 3 == 0 {
                                        if memojiIndex < memojiList.count - 1 {
                                            memojiIndex += 1
                                            withAnimation(.easeInOut(duration: 0.3)) {
                                                selectedMemoji = memojiList[memojiIndex]
                                            }
                                        }
                                    }
                                }
                                
                                NotificationManager.shared.scheduleNotification(
                                    title: "Timer Started",
                                    body: "Stay focused — your timer is now running!"
                                )
                                speak("Time is Started and Stay Focused")
                            }
                            isRunning.toggle()
                        }) {
                            Spacer()
                            Image(systemName: isRunning ? "pause.fill" : "timer")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            Text(isRunning ? "Stop Timer" : "Start Timer")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(15)
                        .padding(20)
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    
                }
            }
            .sheet(isPresented: $showMemojiPicker) {
            }
            
            
        }
        .background(Color.init(hex: "#1A1A1D"))
        .onAppear {
            NotificationManager.shared.requestAuthorization()
        }
        
        
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            resetTimer()
        }
        
        
    }
    
    func speak(_ message: String) {
        let utterance = AVSpeechUtterance(string: message)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    func resetTimer() {
        self.timer?.invalidate()
        self.timer = nil
        self.secondsElapsed = 0
        self.time = "00:00"
        
        NotificationManager.shared.scheduleNotification(
            title: "Timer Stopped",
            body: "Stay focused — your timer is now stopped!"
        )
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
                    .frame(width: 60, height: 60)
                
                Image("memoji_1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Text(name)
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .foregroundColor(.white)
                .opacity(0.5)
                .padding(.top,6)
        }
    }
}


extension Color {
    static let sheetBackground = Color(hex: "#3D365C")
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(.sRGB, red: r, green: g, blue: b)
    }
}


func formatTime(seconds: Int) -> String {
    let minutes = seconds / 60
    let seconds = seconds % 60
    return String(format: "%02d:%02d", minutes, seconds)
}
