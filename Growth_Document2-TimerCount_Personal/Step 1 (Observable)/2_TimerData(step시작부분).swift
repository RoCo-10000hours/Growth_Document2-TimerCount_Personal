//
//  TimerData.swift
//  5-test
//
//  Created by 앙겔로스 on 2022/10/24.
//

import Foundation

class TimerData: ObservableObject { //1)class를 만드는데 view화면에서도 이걸 바라볼 수 있게하기위해 'ObservableObject프로토콜' 사용한 상황
    // 질문.... 왜 class? struct는안됨?? 응..안됨..그냥 '애플'이 그렇게 정해놨음
    
    
    
    
    
//    var timerCount: Int = 0           // 12)그래서 얘를 아래로 바꿔준거임
   @Published var timerCount: Int = 0       // 13)이렇게해주면 TimeData를 참고(바라봄)하기로한 View들의 입장에선
                                            //  @published라는 '''프로퍼티 래퍼'''를 통해
                                            //프로퍼티래퍼의 값(timeCount)이 변경될 때마다
                                            //모든 '''구.독.자'''들에게 변화(update)를 알려준다
    
    //14)) 여기까지 수행하면 다음할일은???
        // contentView로 돌아가서 가져가 사용하는 일 <-----------------
    
    
    
    
    
    var timer: Timer?               //Timer라는 특정'클.래.스'를 옵셔널로 만들어줌.... 왜?? 일단책에서 예제가 그래서
    //여튼간에 여기까지가 ----> Timer라는 type의 '옵셔널객체'가 하나 생성된상황
    //타이머를 통해서 자동적으로 '시간이 흐를떄마다 어떤 이벤트를 해주는 것'을 집어넣기위함
    
    
    
    init() {
        //        timer = Timer()   ////2)일단 TimerCount는 이미 값이 있기에 놔두고  일단 그냥 왼쪽처럼 놔둘수도있겠지만,
        //좀 특별한 무언가를 시도해보고 싶어졌음. 매서드 하나 추가(.scheduledTimer~~)
        // 아래 매서드코드를 '공식문서'들어가보니
        //// 3)    스샷 2번. 처럼 나옴
        //문서 내려가서 Declaration부분을 해석해보자면,
        //이 매서드는 일단 '클래스 매서드' 이다. 즉 타이머객체를 만들지 않고도 바로 호출(만들어내기가)
        //가능하다(Timer.<-- 쩜(point) 요형태로)
        //그리고 아래쭉 내려가보면  ' ) ->Ttimer ' 이걸로 확인가능한 점은
        //결과적으로는 Timer를 '반환'한다는 것...
        //근데... 특별한타이머를 우리가 지정해서 우리가 가져올 수 있다는것!
        //특별한 타이머??(timeInterval, target, selcecor...)
        //그래서 아예 이름자체도 [scheduledTimer]---->["특정한 시간마다 일을 벌이는 타이머 ㅋㅋ"]
        
        //target?? 시간바뀔때마다 누구에게 알려줄까? 음 .. 스스로(TimerData)한테...
        //event가 발생하면 timer가 누군가의 도움으로 호출이 필요한데 그역할을 self가 수행.
        //self가 timerData에게 알려줌
        //그다음 selector('옵젝C에있는 매서드' 개념이라 일단은 #을쓴다는것정도만 기억하자)
        
        ////4) 3번이후 #selector안에 적용시켜줌
        // 5) 'userInfo는 딱히 쓸만한거없으니 nil' 해준거고, 'repeats는 계속 반복할거니깐 true'
        /// (** 이렇게되면 아래코드에서 1초 한번찍고 그아래내려가서 카운트에서 +1직고하는게 true라서 ㄱ/ㅔ속 반복됨)
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: true)
        
    }
    
    
    // @objc func timerDidFire() {               //3) 만약에 timer가 끝나버리면?
    //// 6) @objc 를 앞쪽에 추가한이유?? 그냥 약속
    /// 7) 그냥 과도기의 유산같은거로 생각 어차피 머지않은 미래에 사라질것
    //    }                                 //8) 즉, <timerDidFire를 실행시키기 위해선 이렇게 ''세트''로 만든다> 정도로만 기억
    //}
    ////  9)  그런데... 어디에 있는 timerDidFire 입니까??? ---->  self  ---->  TimerData
    ///             ' ' 세트 ' '라는 표현해 익숙해 지기를...
    
    
    @objc func timerDidFire() {
        timerCount += 1                 ////  10)시간증가 마다 1씩증가
                                        
    }
    
    func resetCount() {                 ///  11) 추가하고 싶은게 또 생겼음.. 바로.... 리겟 버튼! ㅋㅋㅋ
        timerCount = 0                      //어라? 그런데 이렇게 0으로하면 위쪽의
                                        ////맨위의 var timerCount: Int = 0 이부분 의미가 없지 않나?
    }
    
}

