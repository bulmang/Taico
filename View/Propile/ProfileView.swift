//
//  ProfileView.swift
//  Taico
//
//  Created by 하명관 on 2022/10/31.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        let customFont = "Raleway-Regular"
        
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    Text("프로필")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 15){
                        
                        Image("Profile_Image")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .offset(y: -30)
                            .padding(.bottom,-30)
                        
                        Text("하명관")
                            .font(.custom(customFont, size: 16))
                            .fontWeight(.semibold)
                        
                        HStack(alignment: .top, spacing: 10) {
                            
                            Image(systemName: "map.fill")
                                .foregroundColor(.gray)
                                
                            
                            Text("주소 :")
                                .font(.custom(customFont, size: 15))
                            
                            Text("경기도 평택시 평택대학교\n현신 3길 24-15\n08208")
                                .font(.custom(customFont, size: 15))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .background(
                        Color.white
                            .cornerRadius(12)
                    )
                    .padding()
                    .padding(.top,40)
                    
                    // Custom Navigation Links...
                    
                    CustomNavigationLink(image:"person",title: "개인정보 관리") {
                        
                        Text("")
                            .navigationTitle("개인정보 관리")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("HomeBG").ignoresSafeArea())
                    }
                    
                    
                    CustomNavigationLink(image:"newspaper",title: "전자 영수증") {
                        
                        Text("")
                            .navigationTitle("전자 영수증")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("HomeBG").ignoresSafeArea())
                    }
                    
                    CustomNavigationLink(image: "star", title: "즐겨찾는 메뉴") {
                        
                        Text("")
                            .navigationTitle("즐겨찾는 메뉴")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("HomeBG").ignoresSafeArea())
                    }
                    
                    CustomNavigationLink(image: "creditcard", title: "카드") {
                        
                        Text("")
                            .navigationTitle("카드")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("HomeBG").ignoresSafeArea())
                    }
                    
                    CustomNavigationLink(image: "questionmark.bubble", title: "고객의 소리") {
                        
                        Text("")
                            .navigationTitle("고객의 소리")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("HomeBG").ignoresSafeArea())
                    }
                    CustomNavigationLink(image: "mappin", title: "매장 정보") {
                        
                        Text("")
                            .navigationTitle("매장 정보")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("HomeBG").ignoresSafeArea())
                    }
                }
                .padding(.horizontal,22)
                .padding(.vertical,20)
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
            
                Color("color2")
                    .ignoresSafeArea()
            )
        }
        .navigationBarHidden(true)
    }
    
    // Avoiding new Structs...
    @ViewBuilder
    func CustomNavigationLink<Detail: View>(image: String,title: String,@ViewBuilder content: @escaping ()->Detail)->some View{
        
        
        
        NavigationLink {
            content()
        } label: {
            
            HStack{
                
                Image(systemName: (image))
                    .foregroundColor(.gray)
                    
                
                Text(title)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding()
            .background(
            
                Color.white
                    .cornerRadius(12)
            )
            .padding(.horizontal)
            .padding(.top,10)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
