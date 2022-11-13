//
//  GiftView.swift
//  Taico
//
//  Created by 하명관 on 2022/11/13.
//

import SwiftUI

struct GiftView: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    @State private var isShowingCoupone = false
    
    var body: some View {
        
        VStack{
            
            Text("선물")
                .foregroundColor(.black)
                .fontWeight(.heavy)
                .font(.system(size: 25))
                .padding()
            
            
            HStack{
                
                Text("받은 선물")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                
                Spacer()
                
                Button{
                    
                    isShowingCoupone.toggle()
                    
                }label: {
                    HStack{
                        Image(systemName: "plus")
                            .foregroundColor(.green)
                            .font(.system(size: 15))
                        
                        Text("제휴사 쿠폰")
                            .foregroundColor(.green)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                        
                  
                        
                        
                        
                    }
                    .padding()
                    
                    
                }.sheet(isPresented: $isShowingCoupone){
                    VStack{
                        Text("제휴사 쿠폰")
                            .foregroundColor(.green)
                            .fontWeight(.heavy)
                            .font(.system(size: 25))
                            .padding()
                        
                        Spacer()
                        
                        Text("사용 가능한 선물이 없습니다.")
                        
                        Spacer()
                        
                    }
                    
                    .presentationDetents([ .fraction(0.40)])
                    .persistentSystemOverlays(.visible)
                }
                
            }
                .overlay (
                    Divider()
                        .overlay(
                            Color(.black).opacity(1)
                        )
                        .padding(.horizontal, 20)
                        .offset(y : 0)
                    ,alignment: .bottom
                )
                .overlay (
                    Divider()
                        .overlay(
                            Color(.black).opacity(1)
                        )
                        .padding(.horizontal, 20)
                        .offset(y : 250)
                    ,alignment: .bottom
                )
            
                

            
            Text("사용 가능한 선물이 없습니다.")
                .foregroundColor(.black)
                .offset(y: 100)
            
            
            
            
            if !sharedData.cartProducts.isEmpty{
                
                Group{
                    Spacer()
                    
                    HStack{
                        
                        Text("남은 결제 금액")
                            .foregroundColor(.black )
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(sharedData.getTotalPrice())
                            .font(.custom(customFont, size: 18).bold())
                            .foregroundColor(Color("color1"))
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        
                        Text("적용하기")
                            .font(.custom(customFont, size: 18).bold())
                            .foregroundColor(.black)
                            .padding(.vertical,18)
                            .frame(maxWidth: .infinity)
                            .background(Color(.gray))
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal,25)
            }
//            HStack{
//                Text("남은 결제 금액")
//                    .fontWeight(.heavy)
//                    .font(.system(size: 20))
//                
//                Spacer()
//                
//                Text(sharedData.getTotalPrice())
//                    .font(.custom(customFont, size: 18).bold())
//                    .foregroundColor(Color("color1"))
//            }
//            .padding()
            

            
            
            
            
            
        }
        
     
    }
}

struct GiftView_Previews: PreviewProvider {
    static var previews: some View {
        GiftView()
    }
}
