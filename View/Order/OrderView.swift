//
//  OrderView.swift
//  Taico
//
//  Created by 하명관 on 2022/11/08.
//

import SwiftUI

struct OrderView: View {
    var animation: Namespace.ID
    
    // Shared Data...
    @EnvironmentObject var sharedData: SharedDataModel
    
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    
    @State private var isShowingSheet = false
    
    @State private var isShowingOrdered = false
    
    
    @Binding var childcartstate: Int
    
    @State var currentIndex: Int = 0
    
    @State var search: String = ""
    
    @available(iOS 16.0, *)
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15){
                
                // Search Bar...
                HStack{

                    Spacer()
                    
                    ZStack{
                        
                        if homeData.searchActivated{
                            SearchBar()
                        }
                        else{
                            SearchBar()
                                .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                    
                        }
                    }
                    .frame(width: getRect().width / 1.6)
                    .padding(.horizontal,25)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            homeData.searchActivated = true
                            sharedData.showDetailProduct = false
                            
                        }
                    }
                    .background(
                        Rectangle()
                            .foregroundColor(Color("color2"))
                            .frame(width: 500,height: 350)
                            
                    )
                    
                    Button{
                        sharedData.showPay.toggle()
                    }label: {
                        Image(systemName: "cart")
                            .font(.title2)
                            .foregroundColor(.white)
                            .overlay(
                                Text("\(childcartstate)")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color("orange"))
                                    .clipShape(Circle())
                                    .offset(x: 15, y: -10)
                                    .opacity(childcartstate != 0 ? 1 : 0)
                            )
                            
                    }
                    .sheet(isPresented: $sharedData.showPay){
                        CartView( childcartstate: $childcartstate)
                            .environmentObject(sharedData)
    //                    .presentationDetents([.medium, .large])
                            .presentationDetents([.fraction(0.99), .fraction(0.50)])
                            .persistentSystemOverlays(.visible)
                    }
                    
                    
                }
                .padding(.horizontal)

                
                Text("Taico\n당신을 위한 음료")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal,25)

                
                // Products Tab....
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 18){
                        
                        ForEach(ProductType.allCases,id: \.self){type in
                            
                            // Product Type View...
                            ProductTypeView(type: type)
                                
                        }
                    }
                    .padding(.horizontal,25)
                }
                .padding(.top,28)
                
                
                // Products Page...
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 25){
                        
                        ForEach(homeData.filteredProducts){product in
                            
                            // Product Card View...
                            ProductCardView(product: product)
                        }
                    }
                    .padding(.horizontal,25)
                    .padding(.bottom)
                    .padding(.top,80)
                }
                .padding(.top,30)
                
                
                
                // See More Button...
                // This button will show all products on the current product type..
                // since here were showing only 4...
                
//                Button {
//                    homeData.showMoreProductsOnType.toggle()
//                } label: {
//
//                    // Since we need image ar right...
//                    Label {
//                        Image(systemName: "arrow.right")
//                    } icon: {
//                        Text("see more")
//                    }
//                    .font(.custom(customFont, size: 15).bold())
//                    .foregroundColor(Color("color1"))
//                }
//                .frame(maxWidth: .infinity,alignment: .trailing)
//                .padding(.trailing)
//                .padding(.top,10)

            }
            .padding(.vertical)
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("HomeBG"))
        // Updating data whenever tab changes...
        .onChange(of: homeData.productType) { newValue in
            homeData.filterProductByType()
        }
        // Preview Issue...
//        .sheet(isPresented: $homeData.showMoreProductsOnType) {
//
//        } content: {
//            MoreProductsView()
//        }
        // Displaying Search View....
        .overlay(
        
            ZStack{
                
                if homeData.searchActivated{
                    SearchView(animation: animation)
                        .environmentObject(homeData)
                }
            }
        )
    }
    
    // Since we're adding matched geometry effect...
    // avoiding code replication...
    @ViewBuilder
    func SearchBar()->some View{
        
        HStack(spacing: 15){
            
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .foregroundColor(.white)

            // Since we need a separate view for search bar....

            TextField("검색", text: .constant(""))
                .disabled(true)
                
            
                
        }
        .padding(.vertical,12)
        .padding(.horizontal)
        .background(
        
            Capsule()
                .strokeBorder(Color.white,lineWidth: 0.8)
        )
    }
    
    @ViewBuilder
    func ProductCardView(product: Product)->some View{
        
        VStack(spacing: 10){
            
            // Adding Matched Geometry Effect...
            ZStack{
                
                if sharedData.showDetailProduct{
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0)
                }
                else{
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "\(product.id)IMAGE", in: animation)
                }
            }
            .frame(width: getRect().width / 2.5, height: getRect().width / 2.5)
        // Moving image to top to look like its fixed at half top...
            .offset(y: -40)
            .padding(.bottom,-80)
            
            Spacer()
            
            Text(product.title)
                .font(.custom(customFont, size: 18))
                .fontWeight(.heavy)
                .padding(.top)
            
            
            Text(product.price)
                .font(.custom(customFont, size: 16))
                .fontWeight(.heavy)
                .foregroundColor(Color("color1"))
                .padding(.top,5)
        }
        .scaleEffect(1.4)
        .padding(.horizontal,20)
        .padding(.bottom,50)
        .padding(.top,40)
        .background(
        
            Color.white
                .cornerRadius(25)
                
        )
        // Showing Product detail when tapped...
        .onTapGesture {
            
            withAnimation(.easeInOut){
                
                sharedData.detailProduct = product
                sharedData.showDetailProduct = true
                homeData.searchActivated = false
            }
        }
        
    }
    
    @ViewBuilder
    func ProductTypeView(type: ProductType)->some View{
        
        Button {
            // Updating Current Type...
            withAnimation{
                homeData.productType = type
            }
        } label: {
            
            Text(type.rawValue)
                .font(.custom(customFont, size: 25))
                .fontWeight(.heavy)
            // Changing Color based on Current product Type...
                .foregroundColor(homeData.productType == type ? Color("color1") : Color.gray)
                .padding(.bottom,10)
            // Adding Indicator at bottom...
                .overlay(
                
                    // Adding Matched Geometry Effect...
                    ZStack{
                        if homeData.productType == type{
                            Capsule()
                                .fill(Color("color1"))
                                .matchedGeometryEffect(id: "PRODUCTTAB", in: animation)
                                .frame(height: 4)
                        }
                        else{
                            
                            Capsule()
                                .fill(Color.clear)
                                .frame(height: 4)
                        }
                    }
                    .padding(.horizontal,-5)
                    
                    ,alignment: .bottom
                )
        }
    }
    
    @ViewBuilder
    func Indicators()->some View{

    }
    
    
}

extension View{

    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
