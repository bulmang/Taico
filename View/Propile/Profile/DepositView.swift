//
//  DepositView.swift
//  Taico
//
//  Created by 하명관 on 2022/11/15.
//

import SwiftUI

struct DepositView: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
        
        NavigationView{
            VStack{
                HStack{
                    
                    Button {
                        // Closing View...
                        withAnimation(.easeInOut){
                            sharedData.showDeposit = false
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .font(.title2)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    Text("일회용 보증금 제도")
                        .foregroundColor(.white)
                        .font(.system(size: 20,weight: .bold))
                        .fontWeight(.semibold)
                        .padding(.trailing)
                    
                    Spacer()
                    


                }
                .padding()
                .background{
                    Color("color2")
                        .ignoresSafeArea()
                }
                
            
                
                ScrollView{
                    
                    
                    
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
                    
                    Link(destination: URL(string:  "https://apps.apple.com/kr/app/%EC%9E%90%EC%9B%90%EC%88%9C%ED%99%98%EB%B3%B4%EC%A6%9D%EA%B8%88/id1613285481")!) {
                        
                        HStack{
                            Spacer()
                            Text("보증금 제도 앱 다운")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .frame(width: 400, height: 70)
                                .background(Color("color2"))
                                .cornerRadius(15)
                                .padding(.bottom,50)
                            Spacer()
                        }

                    }
                }
            }
        }
        .navigationBarHidden(true)

        

    }
}

struct DepositView_Previews: PreviewProvider {
    static var previews: some View {
        DepositView()
    }
}
