//
//  CouponeView.swift
//  Taico
//
//  Created by 하명관 on 2022/11/14.
//

import SwiftUI

struct CouponeView: View {
    
    @State var ColorCard: Bool = false
    
    var body: some View {
        VStack{
            Text("쿠폰")
                .foregroundColor(.black)
                .fontWeight(.heavy)
                .font(.system(size: 25))
                .padding()
            
            ZStack{
                
                NeuromorphicUI {
                    
                    RoundedRectangle(cornerRadius: 25)
                        .frame(maxWidth: .infinity)
                        .frame(height: 180)
                    
                }
                .padding()
                .ignoresSafeArea()
                HStack{
                    
                    Button{
                        
                        ColorCard.toggle()
                        
                        
                    } label: {
                        
                        VStack{

                                
                            
                            Text("10 쿠폰%")
                                .foregroundColor(.black)
                                .fontWeight(.heavy)
                                .font(.system(size: 30))
                                .offset(x:-80,y:-50)
                            
                            Text("융합소프트웨어학과 할인")
                                .foregroundColor(.black)
                                .fontWeight(.heavy)
                                .font(.system(size: 30))
                                .padding(.horizontal)
                        }
                        .frame(width: 335,height: 200)
                        
                        

                    }
                    .offset(y:30)
                    
                    Spacer()
                    
                    Circle()
                        .fill(ColorCard ? Color("color2") : Color(.white))
                        .frame(width: 20, height: 20)
                        .overlay{
                            Circle()
                                .stroke(.black,lineWidth: 3)
                                .frame(width: 30, height: 30)
                        }
                        .padding(.horizontal,20)
                        .offset(y:-40)
                    
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity,alignment: .leading)
            }
            
            
            
            
            
            Spacer()
            
        }
    }
}

struct CouponeView_Previews: PreviewProvider {
    static var previews: some View {
        CouponeView()
    }
}
