//
//  __testApp.swift
//  5-test
//
//  Created by Ro-Co on 2022/10/25.
//

import SwiftUI

@main
struct __testApp: App {
    var body: some Scene {
        WindowGroup {
//          ContentView()                              // 22)여기도 똑같이 ContentView가 원하고있는 timerData를 만들어서 넣어주어야한다.
            ContentView(timerData: TimerData())       //  ContentView(timerData: TimerData()) 이렇게...
        }                                             // 왜냐하면 이 부분들도 역시나 사용자에게 보여지고있는 '''화면'''이기 때문이다
    }
}


                                            //23) 여기서 잠깐의 정리를 해보자면....
                                            //State 같은경우엔 : body안에서 textField라던지 toggleButton라던지해서 특정데이터를 화면상
                                            //                '''입력'''할수 있는화면이 있을경우 그데이터를 그대로 받아서 '담을 수 있는 그릇'을 만들어주고,
                                            //                데이터가 새로 변할때마다 body를 새로 그려줌으로서 가동이 되게 해준다
                                            //ObservableObject 경우엔 : 그런식으로 가동되는걸 건너뛰어서 .. 그러니깐 body부분에서 '''input(입력)'''이
                                            //                        되는것이 아니라.. timerData같은애 스스로가 어떠한 event를 따로 발생시켜가지고
                                            //                        데이터가 변화될 경우, 그떄그때마다 '''published 되있는'''것들에 대해서는
                                            //                       (현재 여기에선 timerCount이부분) 그부분(body내에 있는 timerData.timerCount)이
                                            //                        직접 바뀌어서 새로 그림을 그린다


                                            // 24) 여기서 좀 더 욕심을 내보자! SecondView를 하나 만들어서 연결해보자
                                            // 파일하나 또 생성(swiftUIview)
