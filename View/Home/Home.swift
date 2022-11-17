//
//  Home.swift
//  Taico
//
//  Created by 하명관 on 2022/10/19.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
        
        
        
        NavigationView{
            
            GeometryReader { geo in
                ZStack{
                    VStack(alignment: .leading){
                        
                        Text("TAICO")
                            .padding(.top,20)
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                            .fontWeight(.heavy)
                            .frame(maxWidth: .infinity,alignment: .center)
                            .padding(.horizontal)
                            .background{
                                Color("color2")
                                    .frame(height: 120)
                                    .ignoresSafeArea()
                                    
                                    
                            }
                            
                        ScrollView(){

                            

                            

                            

                            VStack(spacing: 40){
                                
                                NavigationLink(destination: Blog1(), isActive: $sharedData.blog1){
                                    Button(action: {
                                        sharedData.blog1 = true
                                    }, label: {
                                        VStack{
                                            Image("image3")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 350,height: 250)
                                            .padding()
                                            .ignoresSafeArea()

                                            
                                            Text("TAICO".uppercased())
                                                .font(.system(size: 20))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.secondary)
                                                .frame(maxWidth: .infinity,alignment: .leading)
                                        }
                                        .padding()
                                        

                                        
                                    })
                                    
                                    
                                }.overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.6), lineWidth: 1)
                                )
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal,6)
                                
                                NavigationLink(destination: Blog2(), isActive: $sharedData.blog2){
                                    Button(action: {
                                        sharedData.blog2 = true
                                    }, label: {
                                        VStack{
                                            Image("image1")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 350,height: 250)
                                            .padding()
                                            .ignoresSafeArea()

                                            
                                            Text("TAICO".uppercased())
                                                .font(.system(size: 20))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.secondary)
                                                .frame(maxWidth: .infinity,alignment: .leading)
                                        }
                                        .padding()
                                        

                                        
                                    })
                                    
                                    
                                }.overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.6), lineWidth: 1)
                                )
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal,6)
                                
                                NavigationLink(destination: Blog3(), isActive: $sharedData.blog3){
                                    Button(action: {
                                        sharedData.blog3 = true
                                    }, label: {
                                        VStack{
                                            Image("image10")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 350,height: 250)
                                            .padding()
                                            .ignoresSafeArea()

                                            
                                            Text("TAICO".uppercased())
                                                .font(.system(size: 20))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.secondary)
                                                .frame(maxWidth: .infinity,alignment: .leading)
                                        }
                                        .padding()
                                        

                                        
                                    })
                                    
                                    
                                }.overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.6), lineWidth: 1)
                                )
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal,6)
                                
                                NavigationLink(destination: Blog4(), isActive: $sharedData.blog4){
                                    Button(action: {
                                        sharedData.blog4 = true
                                    }, label: {
                                        VStack{
                                            Image("image6")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 350,height: 250)
                                            .padding()
                                            .ignoresSafeArea()

                                            
                                            Text("TAICO".uppercased())
                                                .font(.system(size: 20))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.secondary)
                                                .frame(maxWidth: .infinity,alignment: .leading)
                                        }
                                        .padding()
                                        

                                        
                                    })
                                    
                                    
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.6), lineWidth: 1)
                                )
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal,6)
                                
                                NavigationLink(destination: Blog5(), isActive: $sharedData.blog5){
                                    Button(action: {
                                        sharedData.blog5 = true
                                    }, label: {
                                        VStack{
                                            Image("image7")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 350,height: 250)
                                            .padding()
                                            .ignoresSafeArea()

                                            
                                            Text("TAICO".uppercased())
                                                .font(.system(size: 20))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.secondary)
                                                .frame(maxWidth: .infinity,alignment: .leading)
                                        }
                                        .padding()
                                        

                                        
                                    })
                                    
                                    
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.6), lineWidth: 1)
                                )
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal,6)
                            }
                            
                        }
                        
                    }
                    
                }
            }
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
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
                    
                        
                                Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 350,height: 250)
                                .padding()
                                .ignoresSafeArea()
                    

                
              
            }
                
                Text(category)
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.bottom,7)
                
                Text(heading)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                    .padding(.bottom,7)
                
                Text(author.uppercased())
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
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
