//
//  SecondView.swift
//  5-test
//
//  Created by 앙겔로스 on 2022/10/25.
//

import SwiftUI

struct SecondView: View {
    
//    @ObservedObject var timerData: TimerData = TimerData()      //<------ 26) 그렇기에 여기도마찬가지로 만들어주면된다
                                                        // 그리고 여긴 그냥 내려가서 쓰기 귀찮아서 바로 선언해줬음 TimerData()
                                                        // 27) 역시 ContentView와 똑같이 작동할 것이다  .스샷7)
                                                        
                            // 28) 그런데 내가그리는 최종그림은.. 2개의 view내에 있는 Count가 서로영향을주고받는 연결된 모습을 원함
                            // 그러기위해선 일단 위의 부분을 ContentView에서 처럼 일단 수정해주고
                            // 마찬가지로 맨아래 prewview부분으로가서
    @ObservedObject var timerData: TimerData
    
    
    
    
    
    var body: some View {
        VStack {                                 // 25) contentView의 '타이머카운트'부분을 그대로 가져와본다면??
            Text("Second View")                     //바로 에러가뜨는 모습(timerData가 없어서) .스샷6)
                .font(.largeTitle)
                                                    
        
            Text("Timer Count = \(timerData.timerCount)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            
            
            
            Button(action: {                            //42번 )
                timerData.resetCount()                  //복붙해온 리셋 버튼
            } ) {
                Text("Reset Counter")
            }
                                          //43번 ).  \@.@/ \@.2/ \@.@/
                                         //사실살 말하자면
                                         //@ObservedObject var timerData: TimerData에서의 '''timerData''' 요기 요
                                        // 저 변수 하나를 가지고 여기저기서 같이 이용하는 것이다..'''참조타입''''reference
        }                               // 거의 참조 타입 그.자.체라 할 수 있다...
                                        //## Catution!) 메모리는 적게 차지할 수 있음. 그러나 이런게 error가 나기시작하면
                                        // 여기저기 다 터지므로. 사용에 있어서는 항상 조심하라는 강사님의 첨언!!!!!
                                        //    (1~ 43번) ......
                                        //    여기까지가 Observable 관련내용..
    }
    
    
    
    
                                                    //41번
                                                    //함수그대로 가져오고 리셋 버튼도 그대로 가져온다.
    func resetCount() {
        timerData.resetCount()
    }
    
    
    
    
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
//        SecondView()
        SecondView(timerData: TimerData())           //29)이런형태로 수정해준다
    }                                               //왜??? 이렇게 해준건가???
}                                   //ContentView에서의 timerData를 여기  SecondView에 '''심어줄'''필요가 있었기 때문..
                                    
                                    // 30) 심어는줬으니 이제 서로 '''연결'''을 해보자 .
                                    //다시 ContentView로 돌아가서
