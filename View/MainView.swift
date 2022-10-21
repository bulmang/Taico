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
    @State var currentTab: BottomTab = .home // 현재 탭의 위치를 home으로 설정
    @State var animatedIcons: [AnimatedIcon] = { // Id, Tab목록 , Animation등을 불러옴
        var tabs: [AnimatedIcon] = []
        for tab in BottomTab.allCases{
            tabs.append(.init(tabIcon: tab, lottieView:LottieAnimationView(name: tab.rawValue,bundle: .main)))
        }
        return tabs
    }()
    @Environment(\.colorScheme) var schme
    var body: some View {
        VStack(spacing: 0){
            TabView(selection: $currentTab) {
                Home()
                    .setBG()
                    .tag(BottomTab.home)
                
                Card()
                    .setBG()
                    .tag(BottomTab.card)
                
                Order()
                    .setBG()
                    .tag(BottomTab.order)
                
                Text("Saved")
                    .setBG()
                    .tag(BottomTab.shopping)
                
                Text("Profile")
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
    }
    
    @ViewBuilder // View를 만들어줌
    func TabBar()->some View{
        HStack(spacing: 0) {
            ForEach(animatedIcons){icon in
                    
                let tabColor: SwiftUI.Color = currentTab == icon.tabIcon ? (schme == .dark ? .white : .black) : .gray.opacity(0.6)
                ResizableLottieView(lottieView: icon.lottieView)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30,height: 30)
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        // updating current tab&playing animation
                        currentTab = icon.tabIcon
                        icon.lottieView.play { _ in
                            // todo
                            
                        }
                    }
            }
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .background{
            (schme == .dark ? Color.black : Color.white)
                .ignoresSafeArea()
        }
        
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
