//
//  FindView.swift
//  Taico
//
//  Created by 하명관 on 2022/10/26.
//
import SwiftUI

struct FindIdView: View {
    
    @State private var name: String = ""
    @State private var birth: String = ""
    @State private var number: String = ""
    @State private var permission: String = ""
    
    @State var isLinkActive: Bool = false
    @State var ColorCircle : Bool = false
    
    @State var alert: Bool = false
    @State var alert2: Bool = false
    @State var alert3: Bool = false
    @State var alert4: Bool = false
    @State var show: Bool = true
    
    @State private var findprofile: Bool = true
    
    var body: some View {
        VStack(spacing: 10){
            
            VStack(alignment: .leading,spacing: 30){
                
                Text("본인확인을 위해\n인증을 진행해 주세요.")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal,20)
                    .padding(.top,30)
                
                Button{
                    
                    ColorCircle.toggle()
                    
                } label: {
                    Label{
                        Text("본인 인증 서비스 약관 전체 동의")
                            .foregroundColor(ColorCircle ? Color("color2") : Color(.black))
                            .fontWeight(.bold)
                    }icon: {
                        Circle()
                            .fill(ColorCircle ? Color("color2") : Color(.white))
                            .overlay{
                                Circle()
                                    .stroke(.black,lineWidth: 1)
                                    .opacity(ColorCircle ? 0 : 1)
                            }
                        
                            .frame(width: 15, height: 15)
                    }
                    .padding(.horizontal,20)
                }
                ZStack{
                    VStack{
                        AgreeButton(title: "휴대폰 본인 인증 서비스 이용약관 동의 (필수)", url: "https://bccard.com/html/individual/pop_up/pop_personal04.html", image:   "chevron.right")
                            
                        
                        
                        AgreeButton(title: "휴대폰 통신사 이용약관 동의 \n(필수)", url: "https://bccard.com/html/individual/pop_up/pop_personal04.html", image:   "chevron.right")
                            
                        
                        
                        
                        
                        AgreeButton(title: "휴대폰 본인 인증 서비스 이용약관 동의 (필수)", url: "https://bccard.com/html/individual/pop_up/pop_personal04.html", image:   "chevron.right")
                            
                        
                        
                        AgreeButton(title: "휴대폰 본인 인증 서비스 이용약관 동의 (필수)", url: "https://bccard.com/html/individual/pop_up/pop_personal04.html", image:   "chevron.right")
                            
                        VStack{
                            CustomTextField(placeHolder: "이름", imageName: "person", bColor: "textColor1", tOpacity: 0.6, value: $name)
                                .opacity(ColorCircle ? 1 : 0)
                            
                            
                            CustomTextField(placeHolder: "생년월일 6자리", imageName: "birthday.cake", bColor: "textColor1", tOpacity: 0.6, value: $birth)
                                .opacity(ColorCircle ? 1 : 0)
                            
                            CustomTextField(placeHolder: "휴대폰 번호", imageName: "phone", bColor: "textColor1", tOpacity: 0.6, value: $number)
                                .opacity(ColorCircle ? 1 : 0)
                            
                            HStack{
                                Text("인증번호")
                                    .foregroundColor(Color(.black).opacity((0.6)))
                                    .padding()
                                    .font(.system(size: 20))
                                    .opacity(ColorCircle ? 1 : 0)
                                if permission.isEmpty {
                                    
                                   
                                }
                                TextField("", text: $permission)
                                    .padding(.leading, 12)
                                    .font((.system(size: 20)))
                                    .frame(height: 45)
                                    .foregroundColor(Color(.black))
                                
                            
                               
                                Button("인증요청") {
                                    if name != "" && birth != "" && number != "" {
                                        alert = true
                                    }else {
                                        alert3 = true
                                    }

                                }
                                .opacity(ColorCircle ? 1 : 0)
                                .padding(.trailing)
                                .alert(
                                    "이름, 생년월일 , 휴대폰 번호를 입력해주세요", isPresented: $alert3){
                                    Button("확인", role: .cancel){
                                        
                                    }
                                }
                                .alert(
                                    "메시지\n 인증 메세지를 보냈습니다.", isPresented: $alert){
                                    Button("확인", role: .cancel){
                                        
                                    }
                                }
                                
                               
                            }
                            .overlay (
                                Divider()
                                    .overlay(
                                        Color(.black).opacity(0.6)
                                    )
                                    .frame(maxWidth: .infinity)
                                    .padding(.top,50)
                                    .padding(.horizontal)
                            )
                            .opacity(ColorCircle ? 1 : 0)
                            Spacer()

                            
                                
                            NavigationLink(destination: LoginView(), isActive: $isLinkActive) {
                                    
                                    Button {
                                        if permission == "" {
                                            alert4 = true
                                        }else {
                                            alert2 = true
                                        }
                                        
                                    } label: {
                                        Text("인증하기")
                                            .fontWeight(.bold)
                                            .foregroundColor(permission == "" ? Color.black : Color.white)
                                            .frame(height: 58)
                                            .frame(minWidth: 0, maxWidth: .infinity)
                                            .background(permission == "" ? Color.black.opacity(0.06) : Color("color2"))
                                            .cornerRadius(15)
                                            .fontWeight(.bold)
                                            .fontWeight(.bold)
                                            .alert(
                                                "인증번호를 입력해주세요", isPresented: $alert4){
                                                Button("확인", role: .cancel){
                                                    
                                                }
                                            }
                                            .alert(
                                                "인증되었습니다.", isPresented: $alert2){
                                                Button("확인", role: .cancel){
                                                    self.isLinkActive = true
                                                }
                                            }
                                            
                                    }
                                    
                                }.padding(.horizontal, 20)
                            }
                            

            
                        
                        
                    }
                    
                    
                    
                    
                }
                
            }
            Spacer()
        }
        
        
        
    }
}

struct FindIdView_Previews: PreviewProvider {
    static var previews: some View {
        FindIdView()
    }
}
