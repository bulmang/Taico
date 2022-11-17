//
//  MainView.swift
//  Taico
//
//  Created by 하명관 on 2022/10/18.
//

import SwiftUI
import Lottie

struct MainView: View {
    init(){
        UITabBar.appearance().isHidden = true
    }
    // Mark : View Properties
    
    @State var color: SwiftUI.Color = .black
    
    @State var currentTab: BottomTab = .home // 현재 탭의 위치를 home으로 설정
    @State var animatedIcons: [AnimatedIcon] = { // Id, Tab목록 , Animation등을 불러옴
        var tabs: [AnimatedIcon] = []
        for tab in BottomTab.allCases{
            tabs.append(.init(tabIcon: tab, lottieView:LottieAnimationView(name: tab.rawValue,bundle: .main)))
        }
        return tabs
    }()
    @StateObject var sharedData: SharedDataModel = SharedDataModel()
    
    // Animation Namespace...
    @Namespace var animation
    
    @State private var cartstate = 0
    
    @State var mainprofile: Bool = true
    
    @Environment(\.colorScheme) var schme
    
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                TabView(selection: $currentTab) {
                    
                    Home()
                        .setBG()
                        .environmentObject(sharedData)
                        .tag(BottomTab.home)
                    
                    
                    Card()
                        .setBG()
                        .tag(BottomTab.card)
                    
                    OrderView(animation: animation, childcartstate: $cartstate)
                        .environmentObject(sharedData)
                        .tag(BottomTab.order)
                    
                    LikedPage()
                        .environmentObject(sharedData)
                        .tag(BottomTab.heart)
                    
                    ProfileView()
                        .environmentObject(sharedData)
                        .setBG()
                        .tag(BottomTab.account)
                    
                    
                }
                
                // ios 16 update
                if #available(iOS 16, *){
                    TabBar()
                        .toolbar(.hidden, for: .tabBar)
                }else{
                    TabBar()
                }
            }
            .background(Color("HomeBG").ignoresSafeArea())
            .overlay(
                
                ZStack{
                    // Detail Page...
                    if let product = sharedData.detailProduct,sharedData.showDetailProduct{
                        
                        ProductDetailView(product: product, animation: animation, childcartstate: $cartstate )
                            .environmentObject(sharedData)
                        // adding transitions...
                            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                    }
                }
            )
        }
        .navigationBarHidden(true)

    }
    
    @ViewBuilder // View를 만들어줌
    func TabBar()->some View{
        HStack(spacing: 0) {
            ForEach(animatedIcons){icon in
                
                Button {
                    // updating tab...
                    currentTab = icon.tabIcon
                    
                    icon.lottieView.play { _ in
                        // todo
                        
                    }
                } label: {
                    
                    ResizableLottieView(lottieView: icon.lottieView, color: $color)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30,height: 30)
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                    // Applying little shadow at bg...
                        .background(
                            
                            
                            
                            Color("color2")
                                .frame(width: 40, height: 40)
                                .opacity(currentTab == icon.tabIcon ? 1 : 0)
                                .cornerRadius(25)
                                
                            // blurring...
                                
                            // Making little big...
                                
                            
                            
                        )
                        .frame(maxWidth: .infinity)
                    
                }
                
                //                ResizableLottieView(lottieView: icon.lottieView, color: $color)
                //                    .aspectRatio(contentMode: .fit)
                //                    .frame(width: 30,height: 30)
                //                    .frame(maxWidth: .infinity)
                //                    .contentShape(Rectangle())
                //                    .onTapGesture {
                //                        // updating current tab&playing animation
                //                        currentTab = icon.tabIcon
                //                        color = (currentTab == icon.tabIcon ? Color.red : Color.black)
                //                        icon.lottieView.play { _ in
                //                            // todo
                //
                //                        }
                //
                //
                //                    }
                
            }
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    @ViewBuilder
    func setBG()->some View{
        self
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background {
                Color.primary
                    .opacity(0.05)
                    .ignoresSafeArea()
            }
    }
}
