//
//  LoginView.swift
//  Taico
//
//  Created by 하명관 on 2022/10/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var isFindActive = false
    @State var isLinkActive = false
    @State var isOrderActive = false
    @State var alert: Bool = false
    @State var alert2: Bool = false
    @State var login: Bool = false
    @State var Id: String = ""
    
    
    
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
                                
                                CustomTextField(placeHolder: "이메일", imageName: "envelope", bColor: "textColor1", tOpacity: 0.6, value: $email)
                                
                                CustomTextField(placeHolder: "비밀번호", imageName: "lock", bColor: "textColor1", tOpacity: 0.6, value: $password)
                            }
                            
                            VStack (alignment: .center){
                                HStack(spacing: 15){
                                    
                                    NavigationLink(destination: FindIdView(), isActive: $isFindActive){
                                        Button(action: {
                                            self.isFindActive = true
                                        }, label: {
                                            Text("아이디 찾기")
                                                .foregroundColor(.black)
                                        })
                                        
                                    }

                                    
                                    Text("|")
                                    
                                    NavigationLink(destination: FindIdView(), isActive: $isFindActive){
                                        Button(action: {
                                            self.isFindActive = true
                                        }, label: {
                                            Text("비밀번호 찾기")
                                                .foregroundColor(.black)
                                        })
                                        
                                    }
                                    
                                }
                                
                                .opacity(0.6)

                                Spacer()
                                
                                
                                NavigationLink(destination: SignUpView(), isActive: $isLinkActive) {
                                    NavigationLink(destination: ProfileView(),isActive: $isOrderActive) {
                                        Button(action: {
                                            if email == "하명관" && password == "1234"{
                                                self.login = true
                                                
                                            }else
                                            if email != "" && password != ""{
                                                self.alert = true
                                            }else{
                                                self.alert2 = true
                                            }
                                            
                                        }, label: {
                                            Text("로그인")
                                                .fontWeight(.bold)
                                                .foregroundColor(password == "" ? Color.black : Color.white)
                                                .frame(height: 58)
                                                .frame(minWidth: 0, maxWidth: .infinity)
                                                .background(password == "" ? Color.black.opacity(0.06) : Color("color2"))
                                                .cornerRadius(15)
                                                .fontWeight(.bold)
                                                .alert("아이디와 비밀번호를 모두 정확히 입력해주세요.", isPresented: $alert2){
                                                    Button("확인", role: .cancel){
                                                    }
                                                }
                                                .alert("가입되지 않은 아이디입니다.회원가입을 하셔야합니다.", isPresented: $alert){
                                                    Button("확인", role: .cancel){
                                                        self.isLinkActive = true
                                                    }
                                                }
                                                .alert("로그인 되셨습니다.", isPresented: $login){
                                                    Button("확인", role: .cancel){
                                                        
                                                        Order(profile: true)
                                                        self.isOrderActive = true
                                                        
                                                    }
                                                }
                                        })
                                    }
                                    
                                    
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
                        
                        HStack(spacing: 20){
                            Text("가입된 계정이 없으신 가요?")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                                .padding(.leading,50)
                            
                            
                            
                            Button(action: {
                                self.isLinkActive = true
                            }, label: {
                                Text("회원가입")
                                    .font(.system(size: 18))
                                    .foregroundColor(Color("color1"))
                                    .fontWeight(.bold)
                            })
                            .padding(.trailing,50)
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
