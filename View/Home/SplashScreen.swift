//
//  SplashScreen.swift
//  Taico
//
//  Created by 하명관 on 2022/11/16.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var isFinished = false // 스플래쉬 화면 끝날때 다른 화면으로 넘어가기
    
    var body: some View {
        
        
        if !isFinished{ // isFinshed가 거짓일때 실행
            
            ZStack{ // x , y , z 중 z에 위치
                
                Color(.white) // 저장해준 배경색 가져오기
                    .ignoresSafeArea() // 아랫부분과 윗부분 모두 지정해주기
                
//                Color("color2") // 저장해준 배경색 가져오기
//                    .ignoresSafeArea() // 아랫부분과 윗부분 모두 지정해주기
                
                // Disney Logo
                GeometryReader{proxy in // GeometryReader는 크게설명하면 하위뷰들의 위치와 모양을 정보를 알려주고 설정하는걸 도움. https://protocorn93.github.io/2020/07/26/GeometryReader-in-SwiftUI/
                    //솔직히 20분넘게 서칭했는데 proxy in은 언제 사용하는지 감도못찾음
                    
                    // For Screen Size
                    let size = proxy.size//아마여기서 size 정보를 제안받는데 쓰는듯 GeometryReader사용
                    
                    ZStack{
                        
                        Text("TAICO")
                            .font(.system(size: 70))
                            .fontWeight(.heavy)
//                            .foregroundColor(.white)
                            .foregroundColor(Color("color2"))
                            .frame(width: size.width / 1.9,
                                   height: size.width / 1.9) // 넓이와 높이 사이즈조정
                        
                    }
                    
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    //zstack의 위치조정
                    
                }
            }
            .onAppear { //View 가 나타날 때  실행될 acttion을 추가 특정항목을 나타낼수가있음.
                
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) { //0.6초 지연
                    
                        withAnimation {
                            isFinished.toggle()
                        }
                    }
                                
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
