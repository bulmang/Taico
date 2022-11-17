//
//  LikedPage.swift
//  EcommerceAppKit (iOS)
//
//  Created by Balaji on 02/12/21.
//

import SwiftUI

struct LikedPage: View {
    @EnvironmentObject var sharedData: SharedDataModel
    
    // Delete Option...
    @State var showDeleteOption: Bool = false
    
    var body: some View {
        
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {

                    
                    
                    VStack{
                        
                        HStack{
                            
                            Text("좋아하는 메뉴")
                                .padding(.top)
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .fontWeight(.heavy)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .padding(.leading,15)
                                .offset(y:-10)
                            
                            
                            Spacer()
                            
                            Button {
                                withAnimation{
                                    showDeleteOption.toggle()
                                }
                            } label: {
                                Image(systemName: "trash.fill")
                                    .foregroundColor(.red)
                                    .frame(width: 35, height: 35)
                            }
                            .background{
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width: 45, height: 45)
                            }
                            .opacity(sharedData.likedProducts.isEmpty ? 0 : 1)
                            .padding(.trailing,40)
                        }
                        .background{
                            Color("color2")
                                .frame(height: 200)
                                .ignoresSafeArea()
                                .offset(y:-55)
                                
                        }
                        
                        .frame(maxWidth: .infinity,alignment: .leading)
                        
                        // checking if liked products are empty...
                        if sharedData.likedProducts.isEmpty{
                            
                            Group{
                                Image("NoLiked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                    .padding(.top,35)
                                
                                Text("등록된 나만의 메뉴가 없습니다.")
                                    .font(.custom(customFont, size: 25))
                                    .fontWeight(.heavy)
                                
                                Text("좋아하는 메뉴에 ❤️를 누르고 편리하게 주문해 보세요.")
                                    .font(.custom(customFont, size: 18))
                                    .foregroundColor(.gray)
                                    .padding(.horizontal)
                                    .padding(.top,10)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        else{
                            
                            // Displaying Products...
                            VStack(spacing: 15){
                                
                                // For Designing...
                                ForEach(sharedData.likedProducts){product in
                                    
                                    HStack(spacing: 0){
                                        
                                        if showDeleteOption{
                                            
                                            Button {
                                                deleteProduct(product: product)
                                            } label: {
                                                Image(systemName: "minus.circle.fill")
                                                    .font(.title2)
                                                    .foregroundColor(.red)
                                            }
                                            .padding(.trailing)
                                            
                                        }
                                        
                                        CardView(product: product)
                                    }
                                }
                            }
                            .padding(.top,25)
                            .padding(.horizontal)
                        }
                        
                    }
                    
                
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
            
                Color("HomeBG")
                    .ignoresSafeArea()
            )
        }
    }
    
    @ViewBuilder
    func CardView(product: Product)->some View{
        
        HStack(spacing: 15){
            
            Image(product.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(product.title)
                    .font(.custom(customFont, size: 18).bold())
                    .lineLimit(1)
                
                Text(product.price)
                    .font(.custom(customFont, size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("color1"))
                
                Text("\(product.type.rawValue)")
                    .font(.custom(customFont, size: 13))
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal,10)
        .padding(.vertical,10)
        .frame(maxWidth: .infinity,alignment: .leading)
        .background(
        
            Color.white
                .cornerRadius(10)
        )
        .onTapGesture {
            
            withAnimation(.easeInOut){
                sharedData.fromSearchPage = true
                sharedData.detailProduct = product
                sharedData.showDetailProduct = true
                
                
                
            }
        }
    }
    
    func deleteProduct(product: Product){
        
        if let index = sharedData.likedProducts.firstIndex(where: { currentProduct in
            return product.id == currentProduct.id
        }){
            
            let _ = withAnimation{
                // removing...
                sharedData.likedProducts.remove(at: index)
            }
        }
    }
}

struct LikedPage_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
