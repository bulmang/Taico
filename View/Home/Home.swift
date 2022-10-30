//
//  Home.swift
//  Taico
//
//  Created by 하명관 on 2022/10/19.
//

import SwiftUI

struct Home: View {
    var body: some View {
        GeometryReader { geo in
            ZStack{
                VStack(alignment: .leading){
                    ScrollView(){

                        
                        Text("안녕하세요\nTAICO입니다")
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)

                            .padding(.trailing, 150.0)

                        VStack(spacing: 40){
                            
                            ForEach(blogs) { blog in
                                CardView(image: blog.image, category: blog.category, heading: blog.heading, author: blog.author, site: blog.site)
                            }
                        }
                        
                    }
                    
                }
                .padding()
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct CardView: View {
    
    var image: String
    var category: String
    var heading: String
    var author: String
    var site: String
    
    var body: some View{
        
        HStack{
            VStack (alignment: .leading){
                
                Link(destination: URL(string:  site)!) {
                    NeuromorphicUI {
                        RoundedRectangle(cornerRadius: 25)
                                .overlay(Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                         
                            )
                            .frame(width: 350,height: 250)
                        
                        .padding()
                        }
                    .ignoresSafeArea()
                    

                
              
            }
                Text(category)
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text(heading)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                
                Text("작성자 : ".uppercased()+author.uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
                
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 1)
            )
            .padding(.bottom)
            
            Spacer()
            
        }
        
            
   
        
    }
    
}
