//
//  TimerModel.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-22.
//

import Foundation
import Combine

class TimerModel: ObservableObject {
    @Published var timeElapsed = 0 // Time in seconds
    private var timer: Timer?
    
    // Start the timer
    func start() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                self.timeElapsed += 1
            }
        }
    }
    
    // Pause the timer
    func pause() {
        timer?.invalidate()
        timer = nil
    }
    
    // Reset the timer
    func reset() {
        timeElapsed = 0
    }
}
