//
//  Home.swift
//  CafeApp
//
//  Created by 하명관 on 2022/10/15.
//


// 커스텈
import Foundation
import SwiftUI
import Combine

struct Order: View {
    // 뷰의 속성들
    @State var currentIndex: Int = 0
    @State var currentTab: Tab = tabs[1]
    
    @Namespace var animation
    
    // 뷰의 새부 속성들
    @State var selectedMilkShake: Drink?
    @State var selectedTeaShake: Tea?
    @State var selectedSmudiShake: Smudi?
    @State var selectedBubbleTeaShake: BubbleTea?
    
    @State var showDetail: Bool = false
    @State var showTeaDetail: Bool = false
    @State var showSmudiDetail: Bool = false
    @State var showBubbleTeaDetail: Bool = false
    
    @State var showCarousel: Bool = true
    @State var showTeaCarousel: Bool = false
    @State var showSmudiCarousel: Bool = false
    @State var showBubbleTeaCarousel: Bool = false
    
    var body: some View {
        VStack {
            HeaderView()
                .background(
                    Rectangle()
                        .foregroundColor(Color("color2"))
                        .frame(height: 400)
                        
                )
            ZStack{
                    
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text(attributedTitle)
                        .font(.largeTitle.bold())
                        .padding(.leading)
                    
                    Text(attributedSubTitle)
                        .font(.largeTitle.bold())
                        .padding(.leading)
                    
                    
                    HStack(spacing: 40){
                        
                        
                        // 커피 버튼
                        Button{
                            showCarousel.toggle()
                            showTeaCarousel = false
                            showSmudiCarousel = false
                            showBubbleTeaCarousel = false
                            
                        }label: {
                            Image("커피")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40,height: 50)
                                .padding(10)
                                .background{
                                    Circle()
                                        .fill(Color("Color"))
                                }
                                .background(content: {
                                    Circle()
                                })
                                .shadow(color: .black.opacity(0.07), radius: 5, x: 5, y:5)
                        }
                        
                        // 차 버튼
                        Button{
                            showTeaCarousel.toggle()
                            showCarousel = false
                            showSmudiCarousel = false
                            showBubbleTeaCarousel = false
                        }label: {
                            Image("티")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40,height: 50)
                                .padding(10)
                                .background{
                                    Circle()
                                        .fill(Color("Color"))
                                }
                                .background(content: {
                                    Circle()
                                })
                                .shadow(color: .black.opacity(0.07), radius: 5, x: 5, y:5)
                        }
                        
                        // 스무디 버튼
                        Button{
                            showSmudiCarousel.toggle()
                            showTeaCarousel = false
                            showCarousel = false
                            showBubbleTeaCarousel = false
                        }label: {
                            Image("스무디")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40,height: 50)
                                .padding(10)
                                .background{
                                    Circle()
                                        .fill(Color("Color"))
                                }
                                .background(content: {
                                    Circle()
                                })
                                .shadow(color: .black.opacity(0.07), radius: 5, x: 5, y:5)
                        }
                        
                        // 버블티 버튼
                        Button{
                            showBubbleTeaCarousel.toggle()
                            showTeaCarousel = false
                            showSmudiCarousel = false
                            showCarousel = false
                        }label: {
                            Image("버블티")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40,height: 50)
                                .padding(10)
                                .background{
                                    Circle()
                                        .fill(Color("Color"))
                                }
                                .background(content: {
                                    Circle()
                                })
                                .shadow(color: .black.opacity(0.07), radius: 5, x: 5, y:5)
                        }
                        
                    }
                    .padding(.horizontal,15)
                    ZStack{
                        
                        
                            
                        
                        GeometryReader{ proxy in
                            let size = proxy.size
                            CarouselView(size: size)
                        }
                        .zIndex(-10)
                        .opacity(showCarousel ? 1 : 0)
                        
                        GeometryReader{ proxy in
                            let size = proxy.size
                            TeaCarouselView(size: size)
                        }
                        .zIndex(-10)
                        .opacity(showTeaCarousel ? 1 : 0)
                        
                        GeometryReader{ proxy in
                            let size = proxy.size
                            SmudiCarouselView(size: size)
                        }
                        .zIndex(-10)
                        .opacity(showSmudiCarousel ? 1 : 0)
                        
                        GeometryReader{ proxy in
                            let size = proxy.size
                            BubbleTeaCarouselView(size: size)
                        }
                        .opacity(showBubbleTeaCarousel ? 1 : 0)
                    }
                }

                
                .frame(maxWidth: .infinity,alignment: .leading)
                .opacity(showDetail ? 0 : 1)
                .opacity(showTeaDetail ? 0 : 1)
                .opacity(showSmudiDetail ? 0 : 1)
                .opacity(showBubbleTeaDetail ? 0 : 1)
            }
            // 문자 속성

            
//            TabMenu()
//                .opacity(showDetail ? 0 : 1)
//                .offset(y:120)
            
            
            
            
            
                    
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        
        .overlay(content: {
            if let selectedMilkShake, showDetail{
                DrinkDetailView(animation: animation, Drinkes: selectedMilkShake, show: $showDetail)
            }
        })
        
        .overlay(content: {
            if let selectedTeaShake, showTeaDetail{
                TeaDetailView(animation: animation, Teas: selectedTeaShake, show: $showTeaDetail)
            }
        })
    
        .overlay(content: {
            if let selectedSmudiShake, showSmudiDetail{
                SmudiDetailView(animation: animation, Smudis: selectedSmudiShake, show: $showSmudiDetail)
            }
        })
        
        .overlay(content: {
            if let selectedBubbleTeaShake, showBubbleTeaDetail{
                BubbleTeaDetailView(animation: animation, BubbleTeas: selectedBubbleTeaShake, show: $showBubbleTeaDetail)
            }
        })
        
        .background{
            Color(.white)
                .ignoresSafeArea()
        }
    }
    
    // 밀크쉐이크 카르셀 뷰
    @ViewBuilder
    func CarouselView(size: CGSize)-> some View{
        VStack(spacing: -40){
            // 스크린 넓이 / 3
            CustomCarousel(index: $currentIndex, items: drinks,spacing: 0,cardPadding: size.width / 3, id: \.id) {
                milkShake, size in
                
                
                // 미리보기 문제
                VStack(spacing: 10){
                    // geometry 적용시키기
                    ZStack{
                        if showDetail && selectedMilkShake?.id == milkShake.id{ // 둘다 트루이고 밀크쉐이크의 아이디가 일치할떄 이미지를 불러온다
                            Image(milkShake.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .rotationEffect(.init(degrees: -2))
                                .opacity(0)
                        }else{
                            Image(milkShake.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .rotationEffect(.init(degrees: -2))
                                .matchedGeometryEffect(id: milkShake.id, in: animation)
                            // animation을 움직이고 다른 View라도 이view들의 위치를 기반으로 움직임 시작점과 끝을 계산
                        }
                    }
                        .background {
                            RoundedRectangle(cornerRadius: size.height / 10 , style: .continuous)
                                .fill(Color("Color"))
                                .padding(.top,40)
                                .padding(.horizontal, -40)
                                .offset(y: -40)
                                .frame(width: 120)
                        }
                    
                    Text(milkShake.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.top,8)
                        
                    Text(milkShake.price)
                        .font(.callout)
                        .fontWeight(.black)
                        .foregroundColor(Color("Color-1"))
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)){
                        selectedMilkShake = milkShake
                        showDetail = true
                    } // 클릭 하였을 때 애니메이션효과가 순서대로 움직일수 있게 만들어줌
                }
                
                
            }
            .frame(height: size.height * 0.8)
            
            Indicators()
        }
        .frame(width: size.width,height: size.height,alignment: .bottom)
        .padding(.bottom,8)
        .opacity(showDetail ? 0 : 1)
        // 백그라운드 커스텀
//        .background{
//            Circle()
//                .fill(.white)
//                .scaleEffect(showDetail ? 1.8 : 1.0, anchor: .bottomLeading)
//                .padding(.top, 40)
//                .ignoresSafeArea()
//
//
//        }
    }
    
    // 차 카르셀 뷰
    @ViewBuilder
    func TeaCarouselView(size: CGSize)-> some View{
        VStack(spacing: -40){
            // 스크린 넓이 / 3
            CustomCarousel(index: $currentIndex, items: teas,spacing: 0,cardPadding: size.width / 3, id: \.id) {
                milkShake, size in
                
                
                // 미리보기 문제
                VStack(spacing: 10){
                    // geometry 적용시키기
                    ZStack{
                        if showTeaDetail && selectedTeaShake?.id == milkShake.id{ // 둘다 트루이고 밀크쉐이크의 아이디가 일치할떄 이미지를 불러온다
                            Image(milkShake.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .rotationEffect(.init(degrees: -2))
                                .opacity(0)
                        }else{
                            Image(milkShake.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .rotationEffect(.init(degrees: -2))
                                .matchedGeometryEffect(id: milkShake.id, in: animation)
                            // animation을 움직이고 다른 View라도 이view들의 위치를 기반으로 움직임 시작점과 끝을 계산
                        }
                    }
                        .background {
                            RoundedRectangle(cornerRadius: size.height / 10 , style: .continuous)
                                .fill(Color("Color"))
                                .padding(.top,40)
                                .padding(.horizontal, -40)
                                .offset(y: -10)
                                .frame(width: 120)
                        }
                    
                    Text(milkShake.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.top,8)
                        
                    Text(milkShake.price)
                        .font(.callout)
                        .fontWeight(.black)
                        .foregroundColor(Color("Color-1"))
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)){
                        selectedTeaShake = milkShake
                        showTeaDetail = true
                    } // 클릭 하였을 때 애니메이션효과가 순서대로 움직일수 있게 만들어줌
                }
                
                
            }
            .frame(height: size.height * 0.8)
            
            Indicators()
        }
        .frame(width: size.width,height: size.height,alignment: .bottom)
        .padding(.bottom,8)
        .opacity(showTeaDetail ? 0 : 1)
        // 백그라운드 커스텀
//        .background{
//            Rectangle()
//                .fill(.white)
//                .scaleEffect(showTeaDetail ? 1.8 : 1.0, anchor: .bottomLeading)
//                .padding(.top, 40)
//                .ignoresSafeArea()
//
//
//        }
    }
    
    // 스무디 카르셀 뷰
    func SmudiCarouselView(size: CGSize)-> some View{
        VStack(spacing: -40){
            // 스크린 넓이 / 3
            CustomCarousel(index: $currentIndex, items: smudis,spacing: 0,cardPadding: size.width / 3, id: \.id) {
                milkShake, size in
                
                
                // 미리보기 문제
                VStack(spacing: 10){
                    // geometry 적용시키기
                    ZStack{
                        if showSmudiDetail && selectedSmudiShake?.id == milkShake.id{ // 둘다 트루이고 밀크쉐이크의 아이디가 일치할떄 이미지를 불러온다
                            Image(milkShake.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .rotationEffect(.init(degrees: -2))
                                .opacity(0)
                        }else{
                            Image(milkShake.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .rotationEffect(.init(degrees: -2))
                                .matchedGeometryEffect(id: milkShake.id, in: animation)
                            // animation을 움직이고 다른 View라도 이view들의 위치를 기반으로 움직임 시작점과 끝을 계산
                        }
                    }
                        .background {
                            RoundedRectangle(cornerRadius: size.height / 10 , style: .continuous)
                                .fill(Color("Color"))
                                .padding(.top,40)
                                .padding(.horizontal, -40)
                                .offset(y: -10)
                                .frame(width: 120)
                        }
                    
                    Text(milkShake.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.top,8)
                        
                    Text(milkShake.price)
                        .font(.callout)
                        .fontWeight(.black)
                        .foregroundColor(Color("Color-1"))
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)){
                        selectedSmudiShake = milkShake
                        showSmudiDetail = true
                    } // 클릭 하였을 때 애니메이션효과가 순서대로 움직일수 있게 만들어줌
                }
                
                
            }
            .frame(height: size.height * 0.8)
            
            Indicators()
        }
        .frame(width: size.width,height: size.height,alignment: .bottom)
        .padding(.bottom,8)
        .opacity(showSmudiDetail ? 0 : 1)
        // 백그라운드 커스텀
//        .background{
//            Rectangle()
//                .fill(.white)
//                .scaleEffect(showSmudiDetail ? 1.8 : 1.0, anchor: .bottomLeading)
//                .padding(.top, 40)
//                .ignoresSafeArea()
//
//
//        }
    }
    
    // 버블티 카르셀 뷰
    func BubbleTeaCarouselView(size: CGSize)-> some View{
        VStack(spacing: -40){
            // 스크린 넓이 / 3
            CustomCarousel(index: $currentIndex, items: bubbleteas,spacing: 0,cardPadding: size.width / 3, id: \.id) {
                milkShake, size in
                
                
                // 미리보기 문제
                VStack(spacing: 10){
                    // geometry 적용시키기
                    ZStack{
                        if showBubbleTeaDetail && selectedBubbleTeaShake?.id == milkShake.id{ // 둘다 트루이고 밀크쉐이크의 아이디가 일치할떄 이미지를 불러온다
                            Image(milkShake.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .rotationEffect(.init(degrees: -2))
                                .opacity(0)
                        }else{
                            Image(milkShake.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .rotationEffect(.init(degrees: -2))
                                .matchedGeometryEffect(id: milkShake.id, in: animation)
                            // animation을 움직이고 다른 View라도 이view들의 위치를 기반으로 움직임 시작점과 끝을 계산
                        }
                    }
                        .background {
                            RoundedRectangle(cornerRadius: size.height / 10 , style: .continuous)
                                .fill(Color("Color"))
                                .padding(.top,40)
                                .padding(.horizontal, -40)
                                .offset(y: -10)
                                .frame(width: 120)
                        }
                    
                    Text(milkShake.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.top,8)
                        
                    Text(milkShake.price)
                        .font(.callout)
                        .fontWeight(.black)
                        .foregroundColor(Color("Color-1"))
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)){
                        selectedBubbleTeaShake = milkShake
                        showBubbleTeaDetail = true
                    } // 클릭 하였을 때 애니메이션효과가 순서대로 움직일수 있게 만들어줌
                }
                
                
            }
            .frame(height: size.height * 0.8)
            
            Indicators()
        }
        .frame(width: size.width,height: size.height,alignment: .bottom)
        .padding(.bottom,8)
        .opacity(showBubbleTeaDetail ? 0 : 1)
        // 백그라운드 커스텀
//        .background{
//            Rectangle()
//                .fill(.white)
//                .scaleEffect(showBubbleTeaDetail ? 1.8 : 1.0, anchor: .bottomLeading)
//                .padding(.top, 40)
//                .ignoresSafeArea()
//
//
//        }
    }
    
    
    
    // 탭 메뉴
    @ViewBuilder
    func TabMenu()-> some View {
        HStack(spacing: 50){
            ForEach(tabs){tab in
                Image(tab.tabImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40,height: 50)
                    .padding(10)
                    .background{
                        Circle()
                            .fill(Color("Color"))
                    }
                    .background(content: {
                        Circle()
                    })
                    .shadow(color: .black.opacity(0.07), radius: 5, x: 5, y:5)
                // 미리 위치를 준비해둠
                    .offset(tab.tabOffset) // 탭 메뉴
                    .scaleEffect(currentTab.id == tab.id ? 1.15 : 0.9, anchor: .bottom)
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            currentTab = tab
                            
                        }
                    }
            }
        }
        .padding(.leading,15)
    }
    
    // Indicators
    @ViewBuilder
    func Indicators()->some View{
        HStack(spacing: 2){
            ForEach(drinks.indices, id: \.self){index in
                Circle()
                    .fill(Color("Color"))
                    .frame(width: currentIndex == index ? 10 : 6, height: currentIndex == index ? 10 : 6)
                    .padding(4)
                    .background {
                        if currentIndex == index{
                            Circle()
                                .stroke(Color("Color"),lineWidth: 1)
                                .matchedGeometryEffect(id: "INDICATOR", in: animation )
                        }
                    }
            }
        }
        .animation(.easeInOut, value: currentIndex)
    }
    
    // 헤더 뷰
    @ViewBuilder
    func HeaderView()->some View{
        HStack{
            Button{
                
            } label: {
                HStack(spacing: 10){
                    Image("Pic1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35,height: 35)
                        .clipShape(Circle())
                    
                    Text("로그인")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                }
                .padding(.leading,8)
                .padding(.horizontal,12)
                .padding(.vertical,6)
                .background{
                    Capsule()
                        .fill(Color("Color-2"))
                }
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .opacity(showDetail ? 0 : 1)
            .opacity(showTeaDetail ? 0 : 1)
            .opacity(showBubbleTeaDetail ? 0 : 1)
            .opacity(showSmudiDetail ? 0 : 1)
            
            // going to show the same button from home view
            
            Button{
                
            }label: {
                Image(systemName: "cart")
                    .font(.title2)
                    .foregroundColor(.black)
                    .overlay(alignment: .topTrailing) {
                        Circle()
                            .fill(.red)
                            .frame(width: 10,height: 10)
                            .offset(x: 2, y: -5)
                    }
            }
            
        }
        .padding(15)
        
    }
    
    var attributedTitle: AttributedString{
        var attString = AttributedString(stringLiteral: "TAICO")
        if let range = attString.range(of: "TAICO"){
            attString[range].foregroundColor = .white
        }
        return attString
    }
    
    var attributedSubTitle: AttributedString{
        var attString = AttributedString(stringLiteral: "당신을 위한 음료")
        if let range = attString.range(of: "당신을 위한 음료"){
            attString[range].foregroundColor = .white
        }
        return attString
    }
}
struct Order_Previews: PreviewProvider {
    static var previews: some View {
        Order()
    }
}
class UserSetting: ObservableObject{
    @Published var score : Int = 0
}
// 상세 뷰
struct DrinkDetailView: View{
    var animation: Namespace.ID
    var Drinkes: Drink
    @ObservedObject var userSetting = UserSetting()
    @Binding var show: Bool
    
    // view 속성들
    @State var orderType: String = "차갑게"
    @State var showContent: Bool = false
    
    var body: some View{
    
        
        VStack{
            HStack{
                Button{
                    withAnimation(.easeInOut(duration: 0.35)){
                        showContent = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.1 ){
                        withAnimation(.easeInOut(duration: 0.35)){
                            show = false
                        }
                    }
                }label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(15)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
            }
            .overlay {
                    Text("주문")
                        .font(.callout)
                        .fontWeight(.semibold)
            }
            .padding(.top, 7)
            .opacity(showContent ? 1 : 0)
            
            HStack(spacing: 0) {
                ForEach(["차갑게","뜨겁게"], id: \.self){ order in
                    Text(order)
                        .font(.system(size: 15,weight: .semibold))
                        .foregroundColor((orderType == order ? .black : .black))
                        .fontWeight((orderType == order ? .bold : .light))
                        .padding(.horizontal,20)
                        .padding(.vertical,10)
                        .background{
                            if orderType == order{
                                Capsule()
                                    .fill(Color("Color-2"))
                                    .matchedGeometryEffect(id: "ORDERTAB", in: animation)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut){orderType = order}
                        }
                }
                    
            }
            .padding(.leading,15)
            .frame(maxWidth: .infinity,alignment: .top)
            .padding(.bottom)
            
            Image(Drinkes.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.init(degrees: -2))
                .matchedGeometryEffect(id: Drinkes.id, in: animation)
            
            GeometryReader{proxy in
                let size = proxy.size
                
                MilkShakeDetails()
                    .offset(y: showContent ? 0 : size.height + 50)
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .transition(.asymmetric(insertion: .identity, removal: .offset(y:0.5)))
        .onAppear{
            withAnimation(.easeInOut.delay(0.1)) {
                showContent = true
            }
        }
    }
    
    // 밑 부분 만들기
    @ViewBuilder
    func MilkShakeDetails()->some View{
        VStack{
            VStack(spacing: 12) {
                Text("512D Code")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text(Drinkes.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(Drinkes.price)
                    .font(.callout)
                    .fontWeight(.black)
                    .foregroundColor(Color("Color"))
                
                Text("20분 대기중")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                HStack(spacing: 12) {
                    Text("수량: ")
                        .font(.callout.bold())
                        
                    Button {
                        if (userSetting.score > 0){
                            self.userSetting.score -= 1
                        }
                    } label: {
                        Image(systemName: "minus")
                            .font(.title3)
                    }
                    Text("\(self.userSetting.score)")
                        .font(.title3)
                    
                    Button {
                        self.userSetting.score += 1
                    } label: {
                        Image(systemName: "plus")
                            .font(.title3)
                    }
                }
                .foregroundColor(.black)
                
                HStack{
                    Button {
                        
                    } label: {
                        Text("장바구니 추가")
                            .foregroundColor(.black)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .padding(.horizontal,25)
                            .padding(.vertical,10)
                            .frame(width: 140)
                            .background{
                                Capsule()
                                    .fill(Color("Color-1"))
                            }
                    }
                    .padding(.top,10)
                    
                    Button {
                        
                    } label: {
                        Text("바로결제")
                            .foregroundColor(.black)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .padding(.horizontal,25)
                            .padding(.vertical,10)
                            .frame(width: 140)
                            .background{
                                Capsule()
                                    .fill(Color("Color-1"))
                            }
                    }
                    .padding(.top,10)
                }
              

            
            }
            .padding(.vertical,20)
            .frame(maxWidth: .infinity)
            .background{
                RoundedRectangle(cornerRadius: 40,style: .continuous)
                    .fill(Color("Color-2"))
            }
            .padding(.horizontal,60)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }

}

// 차 상세 뷰
struct TeaDetailView: View{
    var animation: Namespace.ID
    var Teas: Tea
    @ObservedObject var userSetting = UserSetting()
    @Binding var show: Bool
    
    // view 속성들
    @State var orderType: String = "현재 주문"
    @State var showContent: Bool = false
    
    var body: some View{
    
        
        VStack{
            HStack{
                Button{
                    withAnimation(.easeInOut(duration: 0.35)){
                        showContent = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.1 ){
                        withAnimation(.easeInOut(duration: 0.35)){
                            show = false
                        }
                    }
                }label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(15)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
            }
            .overlay {
                    Text("주문")
                        .font(.system(size: 20))
                        .font(.callout)
                        
            }
            .padding(.top, 7)
            .opacity(showContent ? 1 : 0)
            
            HStack(spacing: 0) {
                ForEach(["현재 주문","지난 주문"], id: \.self){ order in
                    Text(order)
                        .font(.system(size: 15,weight: .semibold))
                        .foregroundColor((orderType == order ? .black : .gray))
                        .padding(.horizontal,20)
                        .padding(.vertical,10)
                        .background{
                            if orderType == order{
                                Capsule()
                                    .fill(Color("Color-2"))
                                    .matchedGeometryEffect(id: "ORDERTAB", in: animation)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut){orderType = order}
                        }
                }
                    
            }
            .padding(.leading,15)
            .frame(maxWidth: .infinity,alignment: .top)
            .padding(.bottom)
            
            Image(Teas.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.init(degrees: -2))
                .matchedGeometryEffect(id: Teas.id, in: animation)
            
            GeometryReader{proxy in
                let size = proxy.size
                
                MilkShakeDetails()
                    .offset(y: showContent ? 0 : size.height + 50)
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .transition(.asymmetric(insertion: .identity, removal: .offset(y:0.5)))
        .onAppear{
            withAnimation(.easeInOut.delay(0.1)) {
                showContent = true
            }
        }
    }
    
    // 밑 부분 만들기
    @ViewBuilder
    func MilkShakeDetails()->some View{
        VStack{
            VStack(spacing: 12) {
                Text("512D Code")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text(Teas.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(Teas.price)
                    .font(.callout)
                    .fontWeight(.black)
                    .foregroundColor(Color("Color"))
                
                Text("20분 대기중")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                HStack(spacing: 12) {
                    Text("수량: ")
                        .font(.callout.bold())
                        
                    Button {
                        if (userSetting.score > 0){
                            self.userSetting.score -= 1
                        }
                    } label: {
                        Image(systemName: "minus")
                            .font(.title3)
                    }
                    Text("\(self.userSetting.score)")
                        .font(.title3)
                    
                    Button {
                        self.userSetting.score += 1
                    } label: {
                        Image(systemName: "plus")
                            .font(.title3)
                    }
                }
                .foregroundColor(.black)
                
                Button {
                    
                } label: {
                    Text("장바구니 추가")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(.horizontal,25)
                        .padding(.vertical,10)
                        .background{
                            Capsule()
                                .fill(Color("Color"))
                        }
                }
                .padding(.top,10)

            
            }
            .padding(.vertical,20)
            .frame(maxWidth: .infinity)
            .background{
                RoundedRectangle(cornerRadius: 40,style: .continuous)
                    .fill(Color("Color-1"))
            }
            .padding(.horizontal,60)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }

}

// 스무디 상세 뷰
struct SmudiDetailView: View{
    var animation: Namespace.ID
    var Smudis: Smudi
    @ObservedObject var userSetting = UserSetting()
    @Binding var show: Bool
    
    // view 속성들
    @State var orderType: String = "현재 주문"
    @State var showContent: Bool = false
    
    var body: some View{
    
        
        VStack{
            HStack{
                Button{
                    withAnimation(.easeInOut(duration: 0.35)){
                        showContent = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.1 ){
                        withAnimation(.easeInOut(duration: 0.35)){
                            show = false
                        }
                    }
                }label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(15)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
            }
            .overlay {
                    Text("주문")
                        .font(.callout)
                        .fontWeight(.semibold)
            }
            .padding(.top, 7)
            .opacity(showContent ? 1 : 0)
            
            HStack(spacing: 0) {
                ForEach(["현재 주문","지난 주문"], id: \.self){ order in
                    Text(order)
                        .font(.system(size: 15,weight: .semibold))
                        .foregroundColor((orderType == order ? .black : .gray))
                        .padding(.horizontal,20)
                        .padding(.vertical,10)
                        .background{
                            if orderType == order{
                                Capsule()
                                    .fill(Color("Color-2"))
                                    .matchedGeometryEffect(id: "ORDERTAB", in: animation)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut){orderType = order}
                        }
                }
                    
            }
            .padding(.leading,15)
            .frame(maxWidth: .infinity,alignment: .top)
            .padding(.bottom)
            
            Image(Smudis.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.init(degrees: -2))
                .matchedGeometryEffect(id: Smudis.id, in: animation)
            
            GeometryReader{proxy in
                let size = proxy.size
                
                MilkShakeDetails()
                    .offset(y: showContent ? 0 : size.height + 50)
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .transition(.asymmetric(insertion: .identity, removal: .offset(y:0.5)))
        .onAppear{
            withAnimation(.easeInOut.delay(0.1)) {
                showContent = true
            }
        }
    }
    
    // 밑 부분 만들기
    @ViewBuilder
    func MilkShakeDetails()->some View{
        VStack{
            VStack(spacing: 12) {
                Text("512D Code")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text(Smudis.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(Smudis.price)
                    .font(.callout)
                    .fontWeight(.black)
                    .foregroundColor(Color("Color"))
                
                Text("20분 대기중")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                HStack(spacing: 12) {
                    Text("수량: ")
                        .font(.callout.bold())
                        
                    Button {
                        if (userSetting.score > 0){
                            self.userSetting.score -= 1
                        }
                    } label: {
                        Image(systemName: "minus")
                            .font(.title3)
                    }
                    Text("\(self.userSetting.score)")
                        .font(.title3)
                    
                    Button {
                        self.userSetting.score += 1
                    } label: {
                        Image(systemName: "plus")
                            .font(.title3)
                    }
                }
                .foregroundColor(.black)
                
                Button {
                    
                } label: {
                    Text("장바구니 추가")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(.horizontal,25)
                        .padding(.vertical,10)
                        .background{
                            Capsule()
                                .fill(Color("Color"))
                        }
                }
                .padding(.top,10)

            
            }
            .padding(.vertical,20)
            .frame(maxWidth: .infinity)
            .background{
                RoundedRectangle(cornerRadius: 40,style: .continuous)
                    .fill(Color("Color-1"))
            }
            .padding(.horizontal,60)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }

}

// 버블티 상세 뷰
struct BubbleTeaDetailView: View{
    var animation: Namespace.ID
    var BubbleTeas: BubbleTea
    @ObservedObject var userSetting = UserSetting()
    @Binding var show: Bool
    
    // view 속성들
    @State var orderType: String = "현재 주문"
    @State var showContent: Bool = false
    
    var body: some View{
    
        
        VStack{
            HStack{
                Button{
                    withAnimation(.easeInOut(duration: 0.35)){
                        showContent = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.1 ){
                        withAnimation(.easeInOut(duration: 0.35)){
                            show = false
                        }
                    }
                }label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(15)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
            }
            .overlay {
                    Text("주문")
                        .font(.callout)
                        .fontWeight(.semibold)
            }
            .padding(.top, 7)
            .opacity(showContent ? 1 : 0)
            
            HStack(spacing: 0) {
                ForEach(["현재 주문","지난 주문"], id: \.self){ order in
                    Text(order)
                        .font(.system(size: 15,weight: .semibold))
                        .foregroundColor((orderType == order ? .black : .gray))
                        .padding(.horizontal,20)
                        .padding(.vertical,10)
                        .background{
                            if orderType == order{
                                Capsule()
                                    .fill(Color("Color-2"))
                                    .matchedGeometryEffect(id: "ORDERTAB", in: animation)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut){orderType = order}
                        }
                }
                    
            }
            .padding(.leading,15)
            .frame(maxWidth: .infinity,alignment: .top)
            .padding(.bottom)
            
            Image(BubbleTeas.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.init(degrees: -2))
                .matchedGeometryEffect(id: BubbleTeas.id, in: animation)
            
            GeometryReader{proxy in
                let size = proxy.size
                
                MilkShakeDetails()
                    .offset(y: showContent ? 0 : size.height + 50)
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .transition(.asymmetric(insertion: .identity, removal: .offset(y:0.5)))
        .onAppear{
            withAnimation(.easeInOut.delay(0.1)) {
                showContent = true
            }
        }
    }
    
    // 밑 부분 만들기
    @ViewBuilder
    func MilkShakeDetails()->some View{
        VStack{
            VStack(spacing: 12) {
                Text("512D Code")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text(BubbleTeas.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(BubbleTeas.price)
                    .font(.callout)
                    .fontWeight(.black)
                    .foregroundColor(Color("Color"))
                
                Text("20분 대기중")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                HStack(spacing: 12) {
                    Text("수량: ")
                        .font(.callout.bold())
                        
                    Button {
                        if (userSetting.score > 0){
                            self.userSetting.score -= 1
                        }
                    } label: {
                        Image(systemName: "minus")
                            .font(.title3)
                    }
                    Text("\(self.userSetting.score)")
                        .font(.title3)
                    
                    Button {
                        self.userSetting.score += 1
                    } label: {
                        Image(systemName: "plus")
                            .font(.title3)
                    }
                }
                .foregroundColor(.black)
                
                Button {
                    
                } label: {
                    Text("장바구니 추가")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(.horizontal,25)
                        .padding(.vertical,10)
                        .background{
                            Capsule()
                                .fill(Color("Color"))
                        }
                }
                .padding(.top,10)

            
            }
            .padding(.vertical,20)
            .frame(maxWidth: .infinity)
            .background{
                RoundedRectangle(cornerRadius: 40,style: .continuous)
                    .fill(Color("Color-1"))
            }
            .padding(.horizontal,60)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }

}

