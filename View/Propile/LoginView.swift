//
//  LoginView.swift
//  Taico
//
//  Created by 하명관 on 2022/10/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var isLinkActive = false
    
    var body: some View {
        NavigationView {
            ZStack ( alignment: .topLeading) {
                VStack {
                    VStack (spacing : 40) {
                        ZStack {
                            Rectangle()
                                .frame(width: 710, height: 478)
                                .padding(.leading, -200)
                                .foregroundColor(Color("color2"))
                                .padding(.top, -200)
                            
//                            Ellipse()
//                                .frame(width: 458, height: 420)
//                                .padding(.trailing, -500)
//                                .foregroundColor(Color("color1"))
//                                .padding(.top, -200)
//
                            VStack(spacing: 20){
                                Text("안녕하세요\n타이코입니다.")
                                    .foregroundColor(.white)
                                    .font(.system(size: 35))
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 80)
                                
                                Text("회원 서비스 이용을 위해 로그인 해주세요.")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 80)
                            }
                            
                            
                        }
                        
                        VStack (spacing: 30) {
                            
                            VStack (spacing: 30) {
                                
                                CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "textColor1", tOpacity: 0.6, value: $email)
                                
                                CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "textColor1", tOpacity: 0.6, value: $password)
                            }
                            
                            VStack (alignment: .trailing){
                                NavigationLink(destination: FindIdView(), isActive: $isLinkActive) {
                                    Button{
                                        self.isLinkActive = true
                                    } label: {
                                        Text("Forgot Password")
                                            .fontWeight(.medium)
                                            .padding(.trailing)
                                    }
                                }

                                
                                
                                NavigationLink(destination: SignUpView(), isActive: $isLinkActive) {
                                    
                                    Button(action: {
                                        self.isLinkActive = true
                                    }, label: {
                                        CustomButton(title: "SIGN IN", bgColor: "color1")
                                    })
                                    
                                }.padding(.horizontal, 20)
                                
                                HStack {
                                    Link(destination: URL(string:  "https://www.apple.com/")!) {
                                        Image("apple")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.horizontal, 60)
                                            .padding(.vertical , 15)
                                            .background(Color("button-bg"))
                                            .cornerRadius(15)
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {}, label: {
                                        Image("google")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.horizontal, 60)
                                            .padding(.vertical , 15)
                                            .background(Color("button-bg"))
                                            .cornerRadius(15)
                                    })
                                }
                                .padding(.horizontal, 20)
                                
                            }
                            
                        }
                        Spacer()
                        
                        HStack{
                            Text("Don't have an acoount?")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                            
                            
                            Button(action: {
                                self.isLinkActive = true
                            }, label: {
                                Text("SIGN UP")
                                    .font(.system(size: 18))
                                    .foregroundColor(Color("color1"))
                                    .fontWeight(.bold)
                            })
                        }
                        .frame(height: 63)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color("color2"))
                        .ignoresSafeArea()
                        
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
