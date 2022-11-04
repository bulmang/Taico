//
//  SignUpView.swift
//  Taico
//
//  Created by 하명관 on 2022/10/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State var name: String = ""
    @State var password: String = ""
    @State var email: String = ""
    @State var cpassword: String = ""
    @State var isLinkActive = false
    @State var alert: Bool = false
    @State var alert2: Bool = false
    
    @State private var signprofile: Bool = false
    
    
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
                            
                            
                            Text("회원가입")
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
                                
                                CustomTextField(placeHolder: "이름", imageName: "person", bColor: "textColor2", tOpacity: 1, value: $name)
                                
                                CustomTextField(placeHolder: "이메일", imageName: "envelope", bColor: "textColor2", tOpacity: 1, value: $email)
                                
                                CustomTextField(placeHolder: "비밀번호", imageName: "lock", bColor: "textColor2", tOpacity: 1.0, value: $password)
                                
                                CustomTextField(placeHolder: "비밀번호 확인", imageName: "lock.fill", bColor: "textColor2", tOpacity: 1.0, value: $password)
                                

                            }
                            
                            VStack (alignment: .trailing){
                                NavigationLink(destination: LoginView(), isActive: $isLinkActive) {
                                    Button(action: {
                                        if name != "" && email != "" && password != "" {
                                            self.alert = true
                                        }else {
                                            self.alert2 = true
                                        }
                                    }, label: {
                                        Text("로그인")
                                            .fontWeight(.bold)
                                            .foregroundColor(password == "" ? Color.black : Color.white)
                                            .frame(height: 58)
                                            .frame(minWidth: 0, maxWidth: .infinity)
                                            .background(password == "" ? Color.gray : Color("color2"))
                                            .cornerRadius(15)
                                            .alert("모두 정확히 입력해주세요.", isPresented: $alert2){
                                                Button("확인", role: .cancel){
                                                }
                                            }
                                            .alert("회원가입을 하셨습니다.", isPresented: $alert){
                                                Button("확인", role: .cancel){
                                                    self.isLinkActive = true
                                                    
                                                }
                                            }
                                    })
                                    
                                }.padding(.horizontal, 20)
                                
                                HStack {
                                    Link(destination: URL(string:  "https://secure4.store.apple.com/kr/shop/signIn?ssi=1AAABhB7FxbEgym-F8PQOsAc0h_3XgHkgNHymWJFyHaYnXeev-bEYrqUAAAA-aHR0cHM6Ly93d3cuYXBwbGUuY29tL2tyL3N0b3JlfGh0dHBzOi8vd3d3LmFwcGxlLmNvbS9rci9zdG9yZXwAAgFIdQmIArEB8XeDgyOXsnU7PZlLcsWl04jL8OlGECGcyA")!) {
                                        Image("apple")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.horizontal, 60)
                                            .padding(.vertical , 15)
                                            .background(Color("button-bg"))
                                            .cornerRadius(15)
                                    }
                                    
                                    Spacer()
                                    
                                    Link(destination: URL(string:  "https://accounts.google.com/v3/signin/identifier?dsh=S-2129707820%3A1666963665688148&continue=https%3A%2F%2Fwww.google.com%2F%3Fclient%3Dsafari%26channel%3Diphone_bm%26ptid%3D19025005%26ptt%3D8%26fpts%3D1666963665275&ec=futura_hpp_bt_si_4746042_p&flowName=GlifWebSignIn&flowEntry=ServiceLogin&ifkv=AQDHYWrdXSW6rWRPFnZz86f8FSjsGn_iUTLTK12u2yWE3WIXke_OplxjyWwqlZ41BsP8nfGrUELWAg")!) {
                                        Image("google")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.horizontal, 60)
                                            .padding(.vertical , 15)
                                            .background(Color("button-bg"))
                                            .cornerRadius(15)
                                    }
                                }
                                .padding(.horizontal, 20)
                                
                            }
                            
                        }
                        Spacer()
                        
                        HStack(spacing:20){
                            Text("계정이 이미 있으신가요?")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                            
                            NavigationLink(destination: LoginView(), isActive:  $isLinkActive) {
                                Button(action: {
                                    self.isLinkActive = true
                                }, label: {
                                    Text("로그인")
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
