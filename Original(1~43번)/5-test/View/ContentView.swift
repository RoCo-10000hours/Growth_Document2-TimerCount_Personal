//
//  ContentView.swift
//  5-test
//
//  Created by 앙겔로스 on 2022/10/24.
//
 
import SwiftUI

struct ContentView: View {
                                // 15) TimerData를 가져와 활용해볼까?
                                //timerData라는 새.로.운 변.수.를 하나 만들어서
                                //일단 여기서 초기화를 시키는모습
                                // 16) -스샷3.)
                                // 그런데 여기까지 완료후 시뮬돌리면? 카운트는 그냥 0에서만'''고정'''되있을거임
                                // 왜??????
                                // 여기아래에서 한번 처음 body를 만들고 보여주는 것을 1회용으로만 하는것이고
                                // 그 이후에 맨위의 변수 timerData의 내용이 바뀌어 나가는것을 '''관찰해줄'''수단이 없기때문이다.
                                // 17) 그런데... 마침 이 timerData의 타입인 TimerData는 ObservableObject를따르기때문에
                                //앞에다가 간단하게 '''@ObservedObject'''를 표시해주는것만으로도
                                // timer데이터가 바뀌어 나갈때마다 적용이 된다. -스샷4.)
                                
//   @ObservedObject var timerData: TimerData = TimerData()
    
    @ObservedObject var timerData: TimerData         // 18) 그런데 만약 위의 TimerData() 이부분이 없다면???
                                                    

    
    
    
    var body: some View {
        
        NavigationView {        // 36)NavigationView라는 '''큰그릇'''설정
                                // - 스샷 9,10.) 이러면 무사히 Second로 페이지 이동 + 타이머도 동시에 반양됨
                                //그 이유는  NavigationLink(destination: SecondView(timerData: timerData)
                            //이부분에서 (timerData: timerData) 뒤쪽에 있는 ''' : timerData'''이 부분!!!
                            //같은Data가 넘어가서 작동을하고 있기 때문이다. 즉 이부분을 아래처럼 바꾸면......---->
                            // (timerData: TimerData()) 이렇게 할경우... "그때그때마다 SecondView 너는 새로운 데이타를
                            // 갖다가 쓰도록 하여라..." 이런 명령이 되기에.... 서로다른 count가 됨.
                            // 그리고......... ContentView는 count가 올라가더라도 SecondView는 0에서 안올라감
                            // 왜???????
                            // (timerData: TimerData()) 여기에서 TimerData()는 새로만들어준애이다. 기존애와다르다
                            // 즉. 따로 다시 @ObservedObject를 처리해주어야 한다 ㅠㅠ
            
            
            
            
            VStack {
                Text("Timer Count = \(timerData.timerCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                
                
                                                        //37)) 버튼을 하나 넣어서 RESET기능 구현해보자
                Button(action: {                        // 지금상태는 단순히 한 줄만 호출하는거라 이와같은 코드로
                    timerData.resetCount()              //카운트를 표시할 수 있다지만, 만약 timerData.resetCount()                                   //이 아래로 내용이 길어지면???? 보기좋지 않다는..미관상? ㅋㅋㅋ
                } ) {                                   //그래서 아예 함수를 새로 만들기로함
                    Text("Reset Counter")
                }
                
                
                
                
                
                
                
                // 31) NavigationLink를 입력함
                NavigationLink(destination: {
                    SecondView(timerData: timerData)       // 32) secondView연결해주고
                    //오른쪽끝의 timerData는 여기 ContentView내에 있는 '그' 'timerData'
                }) {                                       // 33) label란 지우고 Text를 하나 만들어줬음
                    Text("Next Screen")
                }                                   //34) 그런데.. 문제가 발생 -스샷8.)
                                                    //35) Next screen부분을 아무리 눌러도 Second로 이동을안함..ㅠㅠ
                                                    // 이유는 바로... '''NavigationView'''가 없어서...
                                                    //NavigationView라는 큰.그.릇. 안에 Link가 들어있어야 하는데 그렇게 못했음
                
                
                
                
           }
            .padding()
        
         }
       
    }
    
                                      // 38) 여기위치가 딱 구조체 내부이면서 body의 밖 부분. 함수만들어봅시다
    func resetCount() {            //이러면 아까 37(번 부분에서  Button(action: resetCount) { ~ 이형태로도 가능하게됨
        timerData.resetCount()
                                        //39)번  근데 왜......Button(action: resetCount) 이부분에서 뒤에 ()없음?
    }                                   // resetCount()를하게되면, resetCount를 실행이아닌 실행한 '''결과'''를 보여주게됨
                                        //우리는 실행한 결과가아닌 함수 그 자체를 넘겨주길 원하므로 괄호없이 쓴거
}                                       //  이 차이점을 잘 인지해두자!!!!!

                                    
                                    //40번)
                                    //secondView에도 리셋을 넣어볼까? --->  뷰이동
  





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()                       // 19) 여기부분ContentView()안에 만들어 직.접. 넣어주면 된다
        ContentView(timerData: TimerData())     // 2가지 방법이 있는데
        
                                                //첫번째. ContentView(timerData: TimerData())
        
                                                //두번째. 새로 상수로 해서 선언해주는것도가능하다
                                                // let timerData: TimerData = TimerData()
                                                // static var previews: some View {
                                                //    ContentView(timerData: TimerData)
                                                //이런식으로 timerData를 만들어서 이내용을가지고 아래에서 너네가 써라.. 이런느낌?
                                                
                                    // 20) 어쨋든 위의식으로 만약에 바꾼다면 두번째 방식은 사실 제약이 많은 방식이기에 그렇다치고
                                    // 첫번째 방식인 만들어서 바로 넣는 방법은 실행될까? 안될거임.
                                    //빌드누르면 ''캔버스프리뷰상에서는 카운트가 올라갈''지라도 ''Buile Failed''가 나올것이다
        
                                    //왜????????
                                    //현재 내가 설정해둔 이 프로젝트의 이름파일인
                                    // 21) __testAPP -스샷5.)부분으로들어가보면
    }
}








///
///
///
///
//파일 관리를 위하여 아예  왼쪽의 파일 TimerData를 폴더밖으로 content속한 폴더의 밖으로
//빼고 시작하기도 한다.앱이 여러개면 더 밖으로 나가는경우도있음
//강사님 추향은 그냥 안에 넣고 하시는 편
// 혹은... 첨부된 스샷(1번)처럼도 주로 하신다고함.. 그러나...이또한 정답은 없다^^
//
// 1) ---> TimeData로 이동
