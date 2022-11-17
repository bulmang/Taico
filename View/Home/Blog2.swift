//
//  Blog2.swift
//  Taico
//
//  Created by 하명관 on 2022/11/18.
//

import SwiftUI
import SDWebImageSwiftUI


struct Blog2: View {
    
    @State var offset: CGFloat = 0
    @State var showCapsule = false
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
        
        NavigationView{
            GeometryReader{proxy in
                
                let rect = proxy.frame(in: .global)
                
                
                    ScrollView{
                        VStack(spacing: 0){
                            
                            HStack{
                                
                                Button {
                                    // Closing View...
                                    withAnimation(.easeInOut){
                                        sharedData.blog2 = false
                                    }
                                } label: {
                                    Image(systemName: "arrow.left")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                        .foregroundColor(Color.black.opacity(0.7))
                                }
                                
                                Spacer()
                                
                                Text("공지사항")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20,weight: .bold))
                                    .fontWeight(.semibold)
                                    .padding(.trailing)
                                
                                Spacer()
                                


                            }
                            .padding(.top,50)
                            .padding()
                            .background{
                                Color("color2")
                                    .ignoresSafeArea()
                            }
                            

                                
                                WebImage(url: URL(string: "https://image.istarbucks.co.kr/img/event/2022/wn_TriStarDash_web_221031.jpg"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: rect.width)
                                // Again Bug So Use CornerRadius...
                                    .cornerRadius(0)
                                    .overlay(Color.black.opacity(0.2))
                            
                        }
                        .ignoresSafeArea()
                    }

                
            }
            .ignoresSafeArea()
        }
        .navigationBarHidden(true)
        

        
    }
}

struct Blog2_Previews: PreviewProvider {
    static var previews: some View {
        Blog2()
    }
}
