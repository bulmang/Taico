//
//  SignUpView.swift
//  Taico
//
//  Created by 하명관 on 2022/10/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var cpassword: String = ""
    @State var isLinkActive = false
    
    var body: some View {
        NavigationView {
            ZStack ( alignment: .topLeading) {
                Color("color1").ignoresSafeArea()
                VStack {
                    VStack(spacing: 40) {
                        ZStack {
                            Ellipse()
                                .frame(width: 458, height: 420)
                                .padding(.trailing, -500)
                                .foregroundColor(Color("color2"))
                                .padding(.top, -200)
                            
                            
                            Text("Creat \n Account")
                                .foregroundColor(.white)
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 20)
                                .padding(.top, 100 )
                        }
                        
                        VStack (spacing: 30) {
                            
                            VStack (spacing: 0) {
                                
                                CustomTextField(placeHolder: "Name", imageName: "person", bColor: "textColor2", tOpacity: 1, value: $name)
                                
                                CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "textColor2", tOpacity: 1, value: $email)
                                
                                CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "textColor2", tOpacity: 1.0, value: $password)
                                
                                CustomTextField(placeHolder: "Confirm Password", imageName: "lock", bColor: "textColor2", tOpacity: 1.0, value: $password)
                            }
                            
                            VStack (alignment: .trailing){
                                NavigationLink(destination: LoginView(), isActive: $isLinkActive) {
                                    Button(action: {
                                        self.isLinkActive = true
                                    }, label: {
                                        CustomButton(title: "SIGN UP ", bgColor: "color2")
                                    })
                                    
                                }.padding(.horizontal, 20)
                                
                                HStack {
                                    Button(action: {}, label: {
                                        Image("apple")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.horizontal, 60)
                                            .padding(.vertical , 15)
                                            .background(Color("button-bg"))
                                            .cornerRadius(15)
                                    })
                                    
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
                            Text("Already have an acoount?")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                            
                            NavigationLink(destination: LoginView(), isActive:  $isLinkActive) {
                                Button(action: {
                                    self.isLinkActive = true
                                }, label: {
                                    Text("SIGN IN")
                                        .font(.system(size: 18))
                                        .foregroundColor(Color("color1"))
                                        .fontWeight(.bold)
                                })
                            }
                        }
                        .frame(height: 63)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color("color2"))
                        .ignoresSafeArea()
                    }
                }
            }
            
            .edgesIgnoringSafeArea(.bottom)
            
            
        }
        .navigationBarHidden(true)
    }
}



struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
