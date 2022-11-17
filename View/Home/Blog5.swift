//
//  Blog5.swift
//  Taico
//
//  Created by 하명관 on 2022/11/18.
//

import SwiftUI
import SDWebImageSwiftUI


struct Blog5: View {
    
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
                                        sharedData.blog5 = false
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
                            

                                
                            Image("image7")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: rect.width)
                                // Again Bug So Use CornerRadius...
                                    .cornerRadius(0)
                                    .overlay(Color.black.opacity(0.2))
                            Image("image7")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: rect.width)
                            // Again Bug So Use CornerRadius...
                                .cornerRadius(0)
                                .overlay(Color.black.opacity(0.2))
                            Image("image7")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: rect.width)
                            // Again Bug So Use CornerRadius...
                                .cornerRadius(0)
                                .overlay(Color.black.opacity(0.2))
                            Image("image7")
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

struct Blog5_Previews: PreviewProvider {
    static var previews: some View {
        Blog5()
    }
}

