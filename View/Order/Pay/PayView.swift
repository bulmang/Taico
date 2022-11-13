//
//  PayView.swift
//  Taico
//
//  Created by 하명관 on 2022/11/11.
//

import SwiftUI


struct PayView: View {
    
    
    
    @State private var isShowingCoupone = false
    @State private var isShowingGift = false
    @State private var isShowing = false
    
    @State var ColorCard : Bool = false
    @State var ColorPay : Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("결제하기")
                .foregroundColor(.black)
                .font(.system(size: 50))
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)


            
            Text("쿠폰 및 할인")
                .font(.system(size: 30))
                .fontWeight(.semibold)
                .padding()
                .padding(.bottom, 10)
            
            
            
            
            Button{
                
                ColorCard.toggle()
                ColorPay = false
                
            
                
            } label: {
                
                Label{
                    Image(systemName: "creditcard.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    
                    Text("신용카드")
                        .font(.system(size: 20))
                        .foregroundColor(Color(.black))
                        .fontWeight(.bold)
                }icon: {
                    Circle()
                        .fill(ColorCard ? Color("color2") : Color(.white))
                        .frame(width: 10, height: 10)
                        .overlay{
                            Circle()
                                .stroke(.black,lineWidth: 3)
                                .frame(width: 20, height: 20)
                        }
                        .padding(.horizontal,20)
                }
                
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.bottom, 40)
            
            Button{
                
                ColorPay.toggle()
                ColorCard = false
                
                
            } label: {
                Label{
                    Image(systemName: "p.square.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    
                    Text("카카오페이")
                        .font(.system(size: 20))
                        .foregroundColor(Color(.black))
                        .fontWeight(.bold)
                }icon: {
                    Circle()
                        .fill(ColorPay ? Color("color2") : Color(.white))
                        .frame(width: 10, height: 10)
                        .overlay{
                            Circle()
                                .stroke(.black,lineWidth: 3)
                                .frame(width: 20, height: 20)
                        }
                        .padding(.horizontal,20)
                }
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.bottom, 20)
            .overlay (
                Divider()
                    .overlay(
                        Color(.black).opacity(0.7)
                    )
                    .padding(.horizontal, 20)
                    .offset(y : 0)
                ,alignment: .bottom
            )
            
            //                    .presentationDetents([.medium, .large])
            
            Text("결제 수단")
                .font(.system(size: 30))
                .fontWeight(.semibold)
                .padding()
                .padding(.bottom, 10)
            
            Button{
                
                isShowingCoupone.toggle()
                
            }label: {
                HStack{
                    Image(systemName: "percent")
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                    
                    Text("쿠폰")
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                    
                    
                    
                }
                .padding()
                
                
            }.sheet(isPresented: $isShowingCoupone){
                VStack{
                    Text("쿠폰")
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                        .font(.system(size: 25))
                        .padding()
                    
                    Spacer()
                    
                    Text("적용 가능한 쿠폰이 없습니다.")
                    
                    Spacer()
                    
                }
                
                .presentationDetents([ .fraction(0.90)])
                .persistentSystemOverlays(.visible)
            }
            
            Button{
                isShowingGift.toggle()
            }label: {
                HStack{
                    Image(systemName: "gift")
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                    
                    Text("선물")
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                    
                    
                    
                }.sheet(isPresented: $isShowingGift){
                    
                    GiftView()
                    .presentationDetents([ .fraction(0.90)])
                    .persistentSystemOverlays(.visible)
                }
                .padding()
                
                
                
            }
            
            Button{
                
            }label: {
                HStack{
                    Image(systemName: "ipad.and.iphone")
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                    
                    Text("통신사 제휴 할인")
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                    
                    
                    
                }
                .padding()
                
                
                
            }
            Spacer()
            
            
            
            
            
            
            
        }
        
    }
}

struct PayView_Previews: PreviewProvider {
    static var previews: some View {
        PayView()
    }
}
