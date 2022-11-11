//
//  PayView.swift
//  Taico
//
//  Created by 하명관 on 2022/11/11.
//

import SwiftUI


struct PayView: View {
    
    @State private var isShowingCard = false
    @State var ColorCircle : Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("결제하기")
                .foregroundColor(.white)
                .font(.system(size: 50))
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom, 40)
                .padding(.top,30)
                .background{
                    Color("color2")
                        .ignoresSafeArea()
                        
                }
                
            Text("결제 수단")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .padding()
            
            Button{
                isShowingCard.toggle()                
            }label: {
                HStack{
                    Image(systemName: "creditcard.fill")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                    
                    Text("신용카드")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                    
                    
                }
                .padding(.horizontal)
                
            }.overlay (
                Divider()
                    .overlay(
                        Color(.black).opacity(0.7)
                    )
                    .padding(.horizontal, 20)
                    .offset(y : 20)
                ,alignment: .bottom
            )
            .sheet(isPresented: $isShowingCard){
                
                VStack{
                    Text("결제 수단")
                        .foregroundColor(.black)
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .padding()
                    
                    Button{
                        
                        ColorCircle.toggle()
                        
                    } label: {
                        Label{
                            Text("신용카드")
                                .font(.system(size: 30))
                                .foregroundColor(Color(.black))
                                .fontWeight(.bold)
                        }icon: {
                            Circle()
                                .fill(ColorCircle ? Color("color2") : Color(.white))
                                .frame(width: 20, height: 20)
                                .overlay{
                                    Circle()
                                        .stroke(.black,lineWidth: 3)
                                        .frame(width: 30, height: 30)
                                }
                                .padding(.horizontal,20)
                        }
                        
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.bottom, 40)
                    
                    Button{
                        
                        ColorCircle.toggle()
                        
                    } label: {
                        Label{
                            Text("신용카드")
                                .font(.system(size: 30))
                                .foregroundColor(Color(.black))
                                .fontWeight(.bold)
                        }icon: {
                            Circle()
                                .fill(ColorCircle ? Color("color2") : Color(.white))
                                .frame(width: 20, height: 20)
                                .overlay{
                                    Circle()
                                        .stroke(.black,lineWidth: 3)
                                        .frame(width: 30, height: 30)
                                }
                                .padding(.horizontal,20)
                        }
                        
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                        Spacer()
    //                    .presentationDetents([.medium, .large])
                        .presentationDetents([ .fraction(0.90)])
                        .persistentSystemOverlays(.visible)
                }
                
                
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
