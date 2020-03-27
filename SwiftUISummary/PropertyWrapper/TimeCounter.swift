//
//  TimeCounter.swift
//  SwiftUISummary
//
//  Created by Hailey on 2020/03/27.
//  Copyright © 2020 Hailey. All rights reserved.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    
    var timer: Timer?
    @Published var counter = 0
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        counter += 1
    }
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}
