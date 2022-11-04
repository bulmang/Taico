//
//  CartView.swift
//  Taico
//
//  Created by 하명관 on 2022/11/04.
//

import SwiftUI

struct CartView: View {
    
    
    
    var body: some View {
        VStack(alignment: .leading,spacing: 30){
            
            Text("장바구니")
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .font(.system(size: 40))
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .background(Color("color2"))
                
            HStack{
                Text("주문 메뉴")
                    .fontWeight(.bold)
                
                Spacer()
                
                Text("총 주문 가능 수량 10개")
            }
            .padding(.horizontal)
            
            ScrollView{
                
                    ForEach(cartdrinks) { cart in
                        cartviews(title: cart.title, price: cart.price, image: cart.image)
                    }
                    
                
            }
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
struct cartviews : View {
    
    var title: String
    var price: String
    var image: String
    
    var body: some View{
        
        VStack (alignment: .leading){
            HStack( spacing: 10){
                
                Image(image)
                    .resizable()
                    .frame(width: 80,height: 80)
                
                Spacer()
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .frame(width: 140)
                
                Spacer()
                
                Text(price)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                    .frame(width: 90)
                
            }
            .padding()

        

            

            
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 1)
        )
    }
}
