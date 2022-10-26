//
//  __testApp.swift
//  5-test
//
//  Created by Ro-Co on 2022/10/25.
//

import SwiftUI

@main
struct __testApp: App {
    // 53번)
    //그런데 나중가면 TimerData()이부분이... 코드가 길어지면길어질수록 저렇게 직접치는게 번거로울수 있을경우엔
    //아래처럼 하면좋다
//    var timerData: TimerData = TimerData()
    //이렇게 처리하면 아래부분을 이렇게 바꾸면 되므로...
      // [   ContentView().environmentObject(timerData)  ]
    
    
    
    
    var body: some Scene {
        WindowGroup {
//            ContentView(timerData: TimerData())                   // 52번)
            ContentView().environmentObject(TimerData())            //이런식으로 바꿔준다....
            
        }
    }
}









