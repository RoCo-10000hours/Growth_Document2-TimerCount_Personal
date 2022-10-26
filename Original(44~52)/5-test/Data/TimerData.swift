//
//  TimerData.swift
//  5-test
//
//  Created by 앙겔로스 on 2022/10/24.
//

import Foundation

class TimerData: ObservableObject {
    
    
    
    
    
   @Published var timerCount: Int = 0
    
    
    
    
    var timer: Timer?
    
    
    init() {
       
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: true)
        
    }
    
    
    
    
    @objc func timerDidFire() {
        timerCount += 1
    }
    
    func resetCount() {
        timerCount = 0                     
                                     
    }
    
}

