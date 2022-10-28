//
//  CustomViews.swift
//  Taico
//
//  Created by 하명관 on 2022/10/23.
//

import SwiftUI

struct CustomViews: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CustomViews_Previews: PreviewProvider {
    static var previews: some View {
        CustomViews()
    }
}

struct CustomTextField: View {
    
    var placeHolder: String
    var imageName: String
    var bColor: String
    var tOpacity: Double
    @Binding var value: String
    
    var body: some View {
        HStack {
            
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.leading,20)
                .foregroundColor(Color(bColor).opacity(tOpacity))
            
            if placeHolder == "비밀번호" || placeHolder == "비밀번호 확인" {
                ZStack (alignment: .leading){
                    if value.isEmpty {
                        Text(placeHolder)
                            .foregroundColor(Color(bColor).opacity((tOpacity)))
                            .padding(.leading, 12)
                            .font(.system(size: 20))
                    }
                    
                    SecureField("", text: $value)
                        .padding(.leading, 12)
                        .font(.system(size:20))
                        .frame(height:45)
                }
            }
            
            else {
                ZStack (alignment: .leading){
                    if value.isEmpty {
                        Text(placeHolder)
                            .foregroundColor(Color(bColor).opacity((tOpacity)))
                            .padding()
                            .font(.system(size: 20))
                    }
                    
                    TextField("", text: $value)
                        .padding(.leading, 12)
                        .font((.system(size: 20)))
                        .frame(height: 45)
                        .foregroundColor(Color(bColor))
                }
            }
        }
        .overlay (
            Divider()
                .overlay(
                    Color(bColor).opacity(tOpacity)
                ).padding(.horizontal, 20)
            ,alignment: .bottom
        )
    }
}


struct CustomButton: View {
    
    var title: String
    var bgColor: String
    
    var body: some View {
        
        Text(title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(height: 58)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color(bgColor))
            .cornerRadius(15)
    }
}

struct TopBarView: View {
    var body: some View {
        Button(action: {}, label: {
            Image("back")
                .resizable()
                .frame(width: 17.5 ,height: 28.5)
                .padding(.horizontal, 20)
                
        })
        
    }
}

struct AgreeButton: View{
    
    var title: String
    var url: String
    var image: String
    
    
    var body: some View{
        HStack(spacing: 40){
            
            Text(title)
                .padding(.leading)
            
            Spacer()
            
            Link(destination: URL(string:(url))!){
                Image(systemName: image)
                    .foregroundColor(.black)
            }
            .padding(.trailing,20)
            
        }
        
        
        
    }
}
