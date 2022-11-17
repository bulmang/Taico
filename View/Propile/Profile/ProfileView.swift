//
//  ProfileView.swift
//  Taico
//
//  Created by 하명관 on 2022/10/31.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    @State var isOrderActive: Bool = false
    
    @State var isFindActive: Bool = false
    
    @State var isQuestionActive: Bool = false
    
    @State var isCardActive: Bool = false
    
    @State var isLikedActive: Bool = false
    
    
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().tintColor = UIColor.black
        
    }
    
    var body: some View {
        
        let customFont = "Raleway-Regular"
        
        NavigationView{
            
            
            
            ScrollView(.vertical, showsIndicators: false) {
                Text("프로필")
                    .padding(.top,30)
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal)
                    .background{
                        Color("color2")
                            .frame(height: 120)
                            .ignoresSafeArea()
                            
                    }
                    .offset(y:-30)
                VStack{
                    

                    
                    
                    VStack(spacing: 15){
                        
                        Image("Profile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .offset(y: -30)
                            .padding(.bottom,-30)
                        
                        Text("하명관")
                            .font(.custom(customFont, size: 26))
                            .fontWeight(.semibold)
                        
                        HStack(alignment: .top, spacing: 10) {
                            
                            Image(systemName: "map.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                            
                            
                            Text("주소 :")
                                .font(.custom(customFont, size: 20))
                            
                            Text("경기도 평택시 평택대학교\n현신 3길 24-15\n07208")
                                .font(.custom(customFont, size: 20))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    .background(
                        Color.white
                            .cornerRadius(12)
                    )
                    .padding()
                    
                    
                    // Custom Navigation Links...
                    NavigationLink(destination: FindIdView(), isActive: $sharedData.showAgree){
                        Button(action: {
                            sharedData.showAgree = true
                        }, label: {
                            HStack{
                                
                                Image(systemName: ("person"))
                                    .foregroundColor(.gray)
                                
                                
                                Text("개인정보 관리")
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
                        })
                        
                    }
                    
                    Link(destination: URL(string:  "https://m.place.naver.com/restaurant/729125957/location?subtab=location")!) {
                        HStack{
                            
                            Image(systemName: ("mappin"))
                                .foregroundColor(.gray)
                            
                            
                            Text("매장 정보")
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
                    
                    
                    
                    NavigationLink(destination: DepositView(), isActive: $sharedData.showDeposit){
                        Button(action: {
                            sharedData.showDeposit = true
                        }, label: {
                            HStack{
                                
                                Image(systemName: ("arrow.3.trianglepath"))
                                    .foregroundColor(.gray)
                                
                                
                                Text("일회용 컵 보증금")
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
                        })
                        
                    }
                    
                    NavigationLink(destination: CardMoney(), isActive: $sharedData.showCardMoney){
                        Button(action: {
                            sharedData.showCardMoney = true
                        }, label: {
                            HStack{
                                
                                Image(systemName: ("creditcard"))
                                    .foregroundColor(.gray)
                                
                                
                                Text("카드 내역")
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
                        })
                        
                        
                    }.foregroundColor(Color(.systemBackground))
                    
                    
                    NavigationLink(destination: QuestionView(), isActive: $sharedData.showQueston){
                        
                        Button(action: {
                            sharedData.showQueston = true
                        }, label: {
                            HStack{
                                
                                Image(systemName: ("questionmark.bubble"))
                                    .foregroundColor(.gray)
                                
                                
                                Text("고객의 소리")
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
                        })
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                }
                .padding(.horizontal)
                
                .padding(.vertical,20)
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                
                Color("HomeBG")
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
        MainView()
    }
}
