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
                    ScrollView{

                        
                        Text("안녕하세요\nTAICO입니다")
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding(.trailing, 150.0)
                        
                        ForEach(blogs) { blog in
                            CardView(image: blog.image, category: blog.category, heading: blog.heading, author: blog.author)
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
    
    var body: some View{
        
        VStack (spacing: 20){
            
            Button{
                
            }label: {
                NeuromorphicUI {
                    RoundedRectangle(cornerRadius: 25)
                        .overlay(Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        )
                        .frame(width: 400,height: 250)
                    }
                .ignoresSafeArea()
                
            }
            
          
        }
   
        
    }
    
}
