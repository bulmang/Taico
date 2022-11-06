//
//  CartView.swift
//  Taico
//
//  Created by 하명관 on 2022/11/04.
//

import SwiftUI

import SwiftUI

struct CartView: View {
    // MARK: Sample Promotion Cards
    @State var promotions: [Promotion] = [
        .init(title: "우롱티", price: "3000원", image: "우롱티"),
        .init(title: "얼그레이티", price: "3000원", image: "얼그레이티"),
        .init(title: "블랙티", price: "3000원", image: "블랙티"),
        .init(title: "쟈스민그린티", price: "3000원", image: "쟈스민그린티")
    ]
    

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12){
                HeaderView()
                    .padding(15)
                
                ForEach(promotions) { promotion in
                    GooeyCell(promotion: promotion){
                        let _ = withAnimation(.easeInOut(duration: 0.3)){
                            promotions.remove(at: indexOf(promotion: promotion))
                        }
                    }
                }
            }
            .padding(.vertical,15)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background {
            Color("BG")
                .ignoresSafeArea()
        }
    }
    
    func indexOf(promotion: Promotion)->Int{
        if let index = promotions.firstIndex(where: { promotion_ in
            promotion.id == promotion_.id
        }){
            return index
        }
        return 0
    }
    
    // MARK: Header View
    @ViewBuilder
    func HeaderView()->some View{
        VStack{
            Text("장바구니")
                .font(.system(size: 38))
                .fontWeight(.bold)
                .foregroundColor(Color("color1"))
                .frame(maxWidth: .infinity,alignment: .center)
            
            HStack{
                Text("주문 메뉴")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
                Spacer()
                
                Text("총 주문 가능 수량 10개")
                    .fontWeight(.semibold)
            }
            .padding()
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

// MARK: Promotion Card View With Gooey Cell Animation
struct GooeyCell: View{
    var promotion: Promotion
    var icon: String = "xmark"
    var onDelete: ()->()
    
    // MARK: Animation Properties
    @State var offsetX: CGFloat = 0
    @State var cardOffset: CGFloat = 0
    @State var finishAnimation: Bool = false
    
    var body: some View{
        let cardWidth = screenSize().width - 35
        let progress = (-offsetX * 0.8) / screenSize().width
        
        ZStack(alignment: .trailing) {
            CanvasView()
            
            HStack{
                VStack(alignment: .leading, spacing: 12) {
                    HStack{
                        Image(promotion.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 82, height: 82)
                        
                        Spacer()
                        
                        Text(promotion.title)
                            .foregroundColor(.black.opacity(0.8))
                        
 
                        
                        Spacer()
                    }
                    
                    

                }
                .lineLimit(1)
                
                Text(promotion.price)
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(Color("color1").opacity(0.7))
            }
            .padding(.horizontal,15)
            .padding(.vertical,10)
            .frame(minHeight: 100)
            .background {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(.white.opacity(0.7))
            }
            .opacity(1.0 - progress)
            .blur(radius: progress * 5.0)
            .padding(.horizontal,15)
            .contentShape(Rectangle())
            .offset(x: cardOffset)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        // MARK: Only Left Swipe
                        var translation = value.translation.width
                        translation = (translation > 0 ? 0: translation)
                        // MARK: Stopping the Card End
                        translation = (-translation < cardWidth ? translation : -cardWidth)
                        offsetX = translation
                        cardOffset = offsetX
                    }).onEnded({ value in
                        // MARK: Release Animation
                        if -value.translation.width > (screenSize().width * 0.6){
                            // MARK: Haptic Feedback
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            finishAnimation = true
                            
                            // Moving Card Outside Of the Screen
                            withAnimation(.easeInOut(duration: 0.3)){
                                cardOffset = -screenSize().width
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                                onDelete()
                            }
                        }else{
                            withAnimation(.easeInOut(duration: 0.3)){
                                offsetX = .zero
                                cardOffset = .zero
                            }
                        }
                    })
            )
        }
    }
    
    // MARK: Implementing Gooey Cell Animation
    // For More About Fluid Animation
    // Check out My Shape Morphing Video's, Link in the Description
    @ViewBuilder
    func CanvasView()->some View{
        let width = (screenSize().width * 0.8)
        let circleOffset = (offsetX / width)
        
        Canvas { ctx, size in
            // Since We Applied Effect Here, It will be Smooth
            ctx.addFilter(.alphaThreshold(min: 0.5,color: Color("Green")))
            ctx.addFilter(.blur(radius: 6))
            
            ctx.drawLayer { layer in
                if let resolvedView = ctx.resolveSymbol(id: 1){
                    layer.draw(resolvedView, at: CGPoint(x: size.width / 2, y: size.height / 2))
                }
            }
        } symbols: {
            GooeyView()
                .tag(1)
        }
        // MARK: Icon View
        .overlay(alignment: .trailing) {
            Image(systemName: icon)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 42, height: 42)
                .offset(x: 42)
                .offset(x: (-circleOffset < 1.0 ? circleOffset : -1.0) * 42)
                .offset(x: offsetX * 0.2)
                .offset(x: 8)
                .offset(x: finishAnimation ? -200 : 0)
                .opacity(finishAnimation ? 0 : 1)
                .animation(.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1), value: finishAnimation)
        }
    }
    
    @ViewBuilder
    func GooeyView()->some View{
        let width = (screenSize().width * 0.8)
        let scale = finishAnimation ? -0.0001 : (offsetX / width)
        let circleOffset = (offsetX / width)
        
        Image("Shape")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 100)
            .scaleEffect(x: -scale,anchor: .trailing)
            // MARK: Adding Some Y Scaling
            .scaleEffect(y: 1 + (-scale / 5),anchor: .center)
            // MARK: Adding Icon View
            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6), value: finishAnimation)
            .overlay(alignment: .trailing, content: {
                Circle()
                    .frame(width: 42, height: 42)
                    // MARK: Moving View Inside
                    .offset(x: 42)
                    .scaleEffect(finishAnimation ? 0.001 : 1, anchor: .leading)
                    .offset(x: (-circleOffset < 1.0 ? circleOffset : -1.0) * 42)
                    .offset(x: offsetX * 0.2)
                    .offset(x: finishAnimation ? -200 : 0)
                    .animation(.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1), value: finishAnimation)
            })
            .frame(maxWidth: .infinity,alignment: .trailing)
            .offset(x: 8)
    }
}

extension View{
    func screenSize()->CGSize{
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        
        return window.screen.bounds.size
    }
}
