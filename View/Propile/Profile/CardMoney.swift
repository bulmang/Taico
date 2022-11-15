//
//  DepositView.swift
//  Taico
//
//  Created by 하명관 on 2022/11/15.
//

import SwiftUI

struct CardMoney: View {
    // MARK: Sample Cards
    @State var cards: [CardModel] = [
        .init(cardImage: "Card2")
        
    ]
    
    // MARK: Animation Properties
    @Namespace var animation
    @State var selectedCard: CardModel?
    @State var showDetail: Bool = false
    @State var showDetailContent: Bool = false
    @State var showExpenses: Bool = false
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 6) {
                Text("안녕하세요\nTAICO 카드입니다.")
                    .foregroundColor(.black)
                    .font(.title.bold())
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                Text("하명관 고객님")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity,alignment: .trailing)
            }
            
            .overlay(alignment: .trailing, content: {
                // MARK: Profile Button
                Button {
                    
                } label: {
                    Image("Pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .offset(x: -20 , y:-15)
                }
            })
            .padding(.horizontal,15)
            .padding(.top,20)
            
            VStack(alignment: .leading, spacing: 6) {
                
                HStack{
                    
                    Text("카드 잔액 : ")
                        .font(.title.bold())
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text("38,000원")
                        .foregroundColor(.black)
                        .font(.title.bold())
                }
                

            }
            .padding(.leading)
            .padding(.top,30)
            .frame(maxWidth: .infinity,alignment: .leading)
            
            CardsScrollView()
                .offset(x:30)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .opacity(showDetail ? 0 : 1)
//        .background {
//            Color("HomeBG")
//                .ignoresSafeArea()
//        }
        .overlay {
            if let selectedCard,showDetail{
                DetailView(card: selectedCard)
                // MARK: For More Fluent Transition Adding Transition
                    .transition(.asymmetric(insertion: .identity, removal: .offset(y: 1)))
            }
        }
    }
    
    // MARK: Cards ScrollView
    @ViewBuilder
    func CardsScrollView()->some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15){
                ForEach(cards){card in
                    GeometryReader{proxy in
                        let size = proxy.size
                        
                        if selectedCard?.id == card.id && showDetail{
                            // MARK: Filling The Empty Space with Same Size
                            Rectangle()
                                .fill(.clear)
                                .frame(width: size.width, height: size.height)
                        }else{
                            Image(card.cardImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            // TIP: Add Geometry Effect Before Everything
                                .matchedGeometryEffect(id: card.id, in: animation)
                            // MARK: Rotating Card For Vertical Look
                                .rotationEffect(.init(degrees: -90))
                            // MARK: Since We Rotated 90deg So the Width And Height Are swapped between each other
                                .frame(width: size.height, height: size.width)
                            // MARK: Placing it Center
                                .frame(width: size.width, height: size.height)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)){
                                        selectedCard = card
                                        showDetail = true
                                    }
                                }
                        }
                    }
                    .frame(width: 300)
                }
            }
            .padding(15)
            .padding(.leading,20)
        }
    }
    
    // MARK: Detail View
    @ViewBuilder
    func DetailView(card: CardModel)->some View{
        VStack{
            HStack{
                Button {
                    withAnimation(.easeInOut(duration: 0.4)){
                        showDetailContent = false
                        showExpenses = false
                    }
                    withAnimation(.easeInOut(duration: 0.5).delay(0.05)){
                        showDetail = false
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.black)
                }

                Text("뒤로가기")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity,alignment: .leading)
            }
            .padding(.bottom,15)
            .opacity(showDetailContent ? 1 : 0)
            
            Image(card.cardImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: card.id, in: animation)
                .rotationEffect(.init(degrees: showDetailContent ? 0 : -90))
                .frame(height: 220)
            
            ExpenseView()
        }
        .padding(15)
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.5)){
                showDetailContent = true
            }
            withAnimation(.easeInOut.delay(0.1)){
                showExpenses = true
            }
        }
    }
    
    
    @ViewBuilder
    func ExpenseView()->some View{
        GeometryReader{proxy in
            let size = proxy.size
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20){
                    Text("결제 내역")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    ForEach(expenses){expense in
                        
                        ExpenseCardView(expense: expense)
                    }
                }
                .padding()
            }
            .frame(width: size.width, height: size.height)
            .background {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color("color2"))
            }
            // MARK: It Will Come From Bottom When it Opened
            .offset(y: showExpenses ? 0 : size.height + 50)
        }
        .padding(.top)
        .padding(.horizontal,10)
    }
}


struct ExpenseCardView: View{
    var expense: Expense
    @State var showView: Bool = false
    var body: some View{
        VStack{
            

            
            HStack(spacing: 14){
                
                Image(expense.productIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45, height: 45)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(expense.product)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Text(expense.spendType)
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(expense.amountSpent)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Text(Date().formatted(date: .numeric, time: .omitted))
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            .foregroundColor(.black)
            // MARK: Animation
            .opacity(showView ? 1 : 0)
            // MARK: To Look Like It's Pushing From Bottom
            .offset(y: showView ? 0 : 20)
            .onAppear {
                // Delay -> Animation Time To Complete the MatchedGeometry Effect
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                    // We Need Index to Animate the content with proper timings
                    withAnimation(.easeInOut(duration: 0.3).delay(Double(getIndex()) * 0.1)){
                        showView = true
                    }
                }
            }
        }

    }
    
    // MARK: Index
    func getIndex()->Int{
        let index = expenses.firstIndex { C1 in
            return C1.id == expense.id
        } ?? 0
        
        
        return index < 20 ? index : 20
    }
}

struct CardMoney_Previews: PreviewProvider {
    static var previews: some View {
        CardMoney()
    }
}
