//
//  TimerViewModel.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-22.
//

import Foundation

class TimerViewModel: ObservableObject {
    @Published var timerModel = TimerModel()
    
    var formattedTime: String {
        let hours = timerModel.timeElapsed / 3600
        let minutes = (timerModel.timeElapsed % 3600) / 60
        let seconds = timerModel.timeElapsed % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func start() {
        timerModel.start()
    }
    
    func pause() {
        timerModel.pause()
    }
    
    func reset() {
        timerModel.reset()
    }
}
