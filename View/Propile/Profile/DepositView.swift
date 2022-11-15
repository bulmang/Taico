//
//  DepositView.swift
//  Taico
//
//  Created by 하명관 on 2022/11/15.
//

import SwiftUI

struct DepositView: View {
    var body: some View {
        VStack{
            
            Text("일회용 컵 보증금제도")
                .font(.system(size: 30))
                .fontWeight(.heavy)
            
            ScrollView{
                
                Link(destination: URL(string:  "https://apps.apple.com/kr/app/%EC%9E%90%EC%9B%90%EC%88%9C%ED%99%98%EB%B3%B4%EC%A6%9D%EA%B8%88/id1613285481")!) {
                    Text("보증금 제도 앱 다운")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .frame(width: 200, height: 40)
                        .background(Color("HomeBG"))
                        .cornerRadius(15)
                }
                
                Image("1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Image("2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Image("3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Image("4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Image("5")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
        }
        

    }
}

struct DepositView_Previews: PreviewProvider {
    static var previews: some View {
        DepositView()
    }
}
