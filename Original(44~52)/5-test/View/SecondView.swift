//
//  SecondView.swift
//  5-test
//
//  Created by 앙겔로스 on 2022/10/25.
//

import SwiftUI

struct SecondView: View {
    
//    @ObservedObject var timerData: TimerData = TimerData()
    // @ObservedObject var timerData: TimerData.      // 49)번
                                                      //contentView에서 했던것처럼 바꿔주고
    @EnvironmentObject var timerData: TimerData       //50번))
                                                      //그 이후 맨 아래로내려가보면
                                                        
                                                   
                                              
                                               
    
    
    
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
                                                    
        
            Text("Timer Count = \(timerData.timerCount)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            
            
            
            Button(action: {
                timerData.resetCount()
            } ) {
                Text("Reset Counter")
            }
                                        
        }
                                       
                                      
    }                                    
    
    
    
    
                                                    
    func resetCount() {
        timerData.resetCount()
    }
    
    
    
    
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
//        SecondView(timerData: TimerData())          //51번))
                                            //당연히 이부분도 필요가없어진다. 아래처럼바꿈
        
        SecondView()   //왜???
                //"어..?? '전역으로'쓰기로한게(timerData)있다고????,나도그럼 그거쓸래!!"
                //이런 느낌이니 기억해 두자!!!!
                //이렇게 처리하면 SecondView를 부를떄도 ''단독''으로 부를수 있기때문에
                // (48(번))에서 발생했떤 error가 사라진다
                    //(스샷 11~12)
        
        //52번 그럼... 이방법의 단점은???????
        // 그러니깐 예를들어 secondView입장에서는 도대체 이 timerData가 어디로부터 흘러들어오는지 알 수없음
        // 전체 모든 코드파일들을 뜯어보는게 아닌이상
        //지금은 코드의 규모가 적기에 괜찮더라도 코드 규모가 커진다면???????
        //그러므로.....이 Environment를 사용하는것에대해서는
        // 최소한으로 그리고 조심스럽게 사용하라는 조언.......
        
        //정리하면...
        // x) @State로 해결가능? 그럼 state로
        // y) @Observable로 해결가능할 정도로 적용할 view가 몇개 안될때? Observable로
        // z) 그래도 안될떈......EnvironmentObject를 사용하되... 잘...꼼꼼히... 내용들을 심어주기를...
//            -------------> ((참고.. 잘 심어준다?? (48번)부분 이 잘 심어준거))
        
        //강사님의 표현으로 정리하자면?
        //스샷 참고 0번.)
        
        
        
    }
}
                                    
                                    
