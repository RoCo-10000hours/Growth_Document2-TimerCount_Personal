//
//  ContentView.swift
//  5-test
//
//  Created by 앙겔로스 on 2022/10/24.
//
 
import SwiftUI

struct ContentView: View {
                             
                                
//   @ObservedObject var timerData: TimerData = TimerData()
                                                                
//    @ObservedObject var timerData: TimerData                  // 47번)
                                                                //이부분을 아래처럼 바꾸면
    @EnvironmentObject var timerData: TimerData     //EnvironmentObject???   어디서든지 공용으로 되있는부분을
                                                    //갖다가 쓰겠다는 의미이다.
                                                    //그렇다면 이렇게 공용으로 갖다 쓸수있게끔 해주는애는
                                                //어디에 위치하고있는거지?-----> 다시 맨아래로 이동

    
    
    
    var body: some View {
        
        NavigationView {
            
            
            VStack {
                Text("Timer Count = \(timerData.timerCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                
                
                                                       
                Button(action: {
                    timerData.resetCount()
                } ) {
                    Text("Reset Counter")
                }
                
                
                
                
                
                
                
                NavigationLink(destination: {                 // 45번) 여기부분을 일단, 주석 처리하고
//                    SecondView(timerData: timerData)
                                                            // 46번) timerData를따로쓰는게아닌
                                                            // 직접 secondView로 가게끔
                    SecondView()                            // <---이렇게 코드를 바꾸고
                    
                }) {
                    Text("Next Screen")
                }
                
                
                
                
           }
            .padding()
        
         }
       
    }
    
    func resetCount() {
        timerData.resetCount()
                                    
    }
}

                                    
                             
  





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
                                                               
        
       // ContentView(timerData: TimerData())                 // 48번) 이부분을 아래처럼 바꿔준다
                                                    
        ContentView()
            .environmentObject(TimerData())                 //의미는???
                                                        //ContentView만들떄 아예 environ~ 만들어지고,
                                                        //그떄마다 TimerData를 생성해줌
                                        //(중요!!!!)
                                        //정리하면 ContentView이후로난 TimerData를 가져다가
                                        //전역으로 두루두루 모두 사용할수 있게끔 한것!!!!
        
        
        
        
                                     //일단 여기까지하면 아까 위에서 만들어둔 SecondView()오류 발생
                                        //왜?? SecondView부분에도 obj이아닌 environm으로 바꿔줘야해서
                                        // 뷰페이지이동------>> SecondView
    }
}




//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


//44번)
//Environment Part.
// 지금은 단순히 1,2개의 view만 존재하지만... 만약에...
// 다양해진다면? 더많아진다면???
// 그럼 그때마다 observableobject만들고 observedobject로까지 다. 코딩할생각???
// 귀찮다.. 다른 방법 없을까???

// 일단 위로 올라가서
