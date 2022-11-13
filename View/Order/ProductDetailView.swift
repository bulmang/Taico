//
//  ProductDetailView.swift
//  Taico
//
//  Created by 하명관 on 2022/11/08.
//

import SwiftUI

let customFont = "Raleway-Regular"

// Since both of the views are mostly identical....
struct ProductDetailView: View {
    var product: Product
    
    // For Matched Geometry Effect...
    var animation: Namespace.ID
    
    // Shared Data Model...
    @EnvironmentObject var sharedData: SharedDataModel
    
    @EnvironmentObject var homeData: HomeViewModel
    
    @StateObject var orderData = OrderViewModel()
    
    @State var orderType: String = "차갑게"
    
    @Binding var childcartstate: Int
    
    @State var showContent: Bool = false
    
    @State var isShowingPay: Bool = false
    
    @State var isShowingSheet: Bool = false
    
    @State var isShowingGift: Bool = false
    
    var body: some View {
        
        VStack{
            
            // Title Bar and Product Image...
            VStack{
                
                // Title Bar...
                HStack{
                    
                    Button {
                        // Closing View...
                        withAnimation(.easeInOut){
                            sharedData.showDetailProduct = false
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .font(.title2)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    Text("주문")
                        .foregroundColor(.white)
                        .font(.system(size: 20,weight: .bold))
                        .fontWeight(.semibold)
                        .padding(.trailing)
                    
                    Spacer()
                    Button {
                        addToLiked()
                    } label: {
                        Image("Liked")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .foregroundColor(isLiked() ? .red : Color.white.opacity(0.7))
                    }


                }
                .padding()
                
                HStack(spacing: 0) {
                    
                        
                }
                .background{
                    Color("HomeBG")
                }
                .padding(.leading,15)
                .frame(maxWidth: .infinity,alignment: .top)
                .padding(.bottom)
                .offset(y: orderData.shoeAnimation ? 50 : 0)
                .zIndex(2)
                // Product Image...
                // Adding Matched Geometry Effect...
                Image(product.productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "\(product.id)\(sharedData.fromSearchPage ? "SEARCH" : "IMAGE")", in: animation)
                    .padding(.horizontal)
                    
                    .frame(maxHeight: .infinity)
                
                
                
                if orderData.startAnimation{
                    
                    VStack{
                        
                        Spacer()
                        
                        ZStack{
                            
                            // Circle ANimatio Effect...
                            
                            Color.white
                                .frame(width: orderData.shoeAnimation ? 100 : getRect().width * 1.3, height: orderData.shoeAnimation ? 100 : getRect().width * 1.3)
                                .clipShape(Circle())
                            // Opacit...
                                .opacity(orderData.shoeAnimation ? 1 : 0)
                            
                            Image(product.productImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .matchedGeometryEffect(id: product.id, in: animation)
                                .frame(width: 80, height: 80)
                        }
                        .frame(width: getRect().width)
                        .frame(height: getRect().height / 2.7)
                        .offset(y: orderData.saveCart ? 90 : -120)
                        // scaling effect...
                        .scaleEffect(orderData.saveCart ? 0 : 1.2)
                        .onAppear(perform: orderData.performAnimations)
                        
                        if !orderData.saveCart{
                            Spacer()
                        }
                        
                        Image(systemName: "cart\(orderData.additemtocart ? ".fill" : "")")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(orderData.additemtocart ? Color("orange") : Color("color1"))
                            .clipShape(Circle())
                            .offset(y: orderData.showBag ? -250 : 300)
                            .frame(width: 150)
                            .frame(height: 150)
                    }
                    // setting external view width to screen width..
                    
                    // moving view down...
                    .offset(y: orderData.endAnimation ? 500 : 0)
                }
            }
            
            .zIndex(1)
            .onAppear{
                withAnimation(.easeInOut.delay(0.1)) {
                    showContent = true
                }
            }
            .onChange(of: orderData.endAnimation, perform: { value in
                
                if orderData.endAnimation{
                    
                    // reset...
                    orderData.resetAll()
                    
                }
            })
            
            // product Details...
            
                
                // Product Data...
            ScrollView(.vertical, showsIndicators: false) {
                
                // Product Data...
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(product.title)
                        .font(.custom(customFont, size: 25).bold())
                    
                    Text(product.subtitle)
                        .font(.custom(customFont, size: 20))
                        .foregroundColor(.gray)
                    
                    
                    Text(product.describe)
                        .font(.custom(customFont, size: 18))
                        .foregroundColor(.black.opacity(0.8))
                    
                    HStack{
                        Text("가격 ")
                            .font(.custom(customFont, size: 26).bold())
                        
                        Spacer()
                        
                        Text(product.price)
                            .font(.custom(customFont, size: 26).bold())
                    }
                    .padding(.top)
                    
                    .overlay (
                        Divider()
                            .overlay(
                                Color(.black).opacity(0.7)
                            )
                            
                            .offset(y : 20)
                        ,alignment: .bottom
                    )
                    .frame(maxWidth: .infinity)
                    Button{
                        isShowingGift.toggle()
                    }label: {
                        HStack{
                            
                            
                            Text("제품 영양 정보")
                                .foregroundColor(.black)
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .font(.system(size: 25))
                            
                            
                            
                        }.sheet(isPresented: $isShowingGift){
                            
                            VStack{
                                Text("제품 영양 정보")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                    .font(.system(size: 30))
                                    .padding()
                                
                                Image("제품")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .padding()
                                    .padding(.top,35)
                                
                                Spacer()
                            }
                        }
                        .padding()
                        
                        
                        
                    }
                    


                    .padding(.vertical,20)
                    
                    // Add button...
                    HStack{
                        
                        Spacer()
                        
                        Button {
                            addToCart()
                            

                        } label: {
                            Text("장바구니\(isAddedToCart() ? " 추가됨" : " 추가") ")
                                .font(.custom(customFont, size: 20).bold())
                                .foregroundColor(isAddedToCart() ? .white : .white)
                                .padding(.vertical,20)
                                .frame(maxWidth: .infinity)
                                .background{
                                    Capsule()
                                        .fill(isAddedToCart() ? Color("color2") : Color("color1"))
                                }
                        }
                        
                        Button {
                            isShowingSheet.toggle()
                            addToCart()
                        } label: {
                            Text("결제")
                                .font(.custom(customFont, size: 20).bold())
                                .foregroundColor(.white)
                                .padding(.vertical,20)
                                .frame(maxWidth: .infinity)
                                .background{
                                    Capsule()
                                        .fill(Color("color1"))
                                }
                        }
                        .sheet(isPresented: $isShowingSheet){
                            CartView( childcartstate: $childcartstate)
                                .environmentObject(sharedData)
                                .presentationDetents([ .fraction(0.99)])
                                .persistentSystemOverlays(.visible)
                        }
                        
                        Spacer()
                    }

                }
                .padding([.horizontal,.bottom],20)
                .padding(.top,25)
                .frame(maxWidth: .infinity,alignment: .leading)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(
                Color.white
                // Corner Radius for only top side....
                    .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25))
                    .ignoresSafeArea()
            )
//                .offset(y: orderData.showBag ? -230 : 0)
                
                
         
        }
        .background(Color("color2").ignoresSafeArea())
    }
    

    
    func isLiked()->Bool{
        
        return sharedData.likedProducts.contains { product in
            return self.product.id == product.id
        }
    }
    
    func isAddedToCart()->Bool{
        
        return sharedData.cartProducts.contains { product in
            return self.product.id == product.id
        }
    }
    
    func addToLiked(){
        
        if let index = sharedData.likedProducts.firstIndex(where: { product in
            return self.product.id == product.id
        }){
            // Remove from liked....
            sharedData.likedProducts.remove(at: index)
        }
        else{
            // add to liked
            sharedData.likedProducts.append(product)
        }
    }
    
    func addToCart(){
        
        if let index = sharedData.cartProducts.firstIndex(where: { product in
            return self.product.id == product.id
        }){
            // Remove from liked....
            sharedData.cartProducts.remove(at: index)
            childcartstate -= 1
        }
        else{
            // add to liked
            withAnimation(.easeInOut(duration: 0.7)){
                orderData.startAnimation.toggle()
            }
            sharedData.cartProducts.append(product)
            childcartstate += 1
        }
    }
}

struct CustomCorners: Shape {

    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
