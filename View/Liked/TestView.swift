////
////  TestView.swift
////  Taico
////
////  Created by 하명관 on 2022/11/17.
////
//
//import SwiftUI
//
//struct TestView: View {
//    // MARK: Sample Promotion Cards
//    @EnvironmentObject var sharedData: SharedDataModel
//    @State var showDeleteOption: Bool = false
//    @State var offsetX: CGFloat = 0
//    @State var cardOffset: CGFloat = 0
//    @State var finishAnimation: Bool = false
//    
//    var onDelete: ()->()
//    
//    var body: some View {
//        
//        let cardWidth = screenSize().width - 35
//        let progress = (-offsetX * 0.8) / screenSize().width
//        
//        ScrollView(.vertical, showsIndicators: false) {
//            VStack(spacing: 12){
//                HeaderView()
//                    .padding(15)
//                
//                if sharedData.cartProducts.isEmpty{
//                    
//                    Group{
//                        Image("NoBasket")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .padding()
//                            .padding(.top,35)
//                        
//                        Text("장바구니가 비어있습니다.")
//                            .font(.custom(customFont, size: 25))
//                            .fontWeight(.semibold)
//                        
//                        Text("원하는 메뉴를 장바구니에 담고 한번에 주문해보세요.")
//                            .font(.custom(customFont, size: 18))
//                            .foregroundColor(.gray)
//                            .padding(.horizontal)
//                            .padding(.top,10)
//                            .multilineTextAlignment(.center)
//                    }
//                }
//                else{
//                 
//                    // Displaying Products...
//                    VStack(spacing: 15){
//                        
//                        // For Designing...
//                        ForEach($sharedData.cartProducts){$product in
//                            
//                            HStack(spacing: 0){
//                                
//                                if showDeleteOption{
//                                    
//                                    Button {
//                                        deleteProduct(product: product)
//                                        
//                                    } label: {
//                                        Image(systemName: "minus.circle.fill")
//                                            .font(.title2)
//                                            .foregroundColor(.red)
//                                    }
//                                    .padding(.trailing)
//
//                                }
//                                
//                                CardViews(product: $product)
//                                    .gesture(
//                                        DragGesture()
//                                            .onChanged({ value in
//                                                // MARK: Only Left Swipe
//                                                var translation = value.translation.width
//                                                translation = (translation > 0 ? 0: translation)
//                                                // MARK: Stopping the Card End
//                                                translation = (-translation < cardWidth ? translation : -cardWidth)
//                                                offsetX = translation
//                                                cardOffset = offsetX
//                                            }).onEnded({ value in
//                                                // MARK: Release Animation
//                                                if -value.translation.width > (screenSize().width * 0.6){
//                                                    // MARK: Haptic Feedback
//                                                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
//                                                    finishAnimation = true
//                                                    
//                                                    // Moving Card Outside Of the Screen
//                                                    withAnimation(.easeInOut(duration: 0.3)){
//                                                        cardOffset = -screenSize().width
//                                                    }
//                                                    
//                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
//                                                        onDelete()
//                                                    }
//                                                }else{
//                                                    withAnimation(.easeInOut(duration: 0.3)){
//                                                        offsetX = .zero
//                                                        cardOffset = .zero
//                                                    }
//                                                }
//                                            })
//                                    )
//                            }
//                        }
//                    }
//                    .padding(.top,25)
//                    .padding(.horizontal,10)
//                }
//            }
//            .padding(.vertical,15)
//        }
//        .frame(maxWidth: .infinity,maxHeight: .infinity)
//        .background {
//            Color("BG")
//                .ignoresSafeArea()
//        }
//        
//    }
//    
//    
//    
//    func deleteProduct(product: Product){
//        
//        if let index = sharedData.cartProducts.firstIndex(where: { currentProduct in
//            return product.id == currentProduct.id
//        }){
//            
//            let _ = withAnimation{
//                // removing...
//                sharedData.cartProducts.remove(at: index)
//                
//            }
//        }
//    }
//    
//    // MARK: Header View
//    @ViewBuilder
//    func HeaderView()->some View{
//        HStack{
//            Text("Promotions")
//                .font(.system(size: 38))
//                .fontWeight(.medium)
//                .foregroundColor(Color("Green"))
//                .frame(maxWidth: .infinity,alignment: .leading)
//            
//            Button {
//                
//            } label: {
//                Image(systemName: "magnifyingglass")
//                    .font(.title2)
//                    .foregroundColor(Color("Green"))
//            }
//        }
//    }
//}
//
//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//            
//    }
//}
//
//
//struct GooeyCell: View{
//    var promotion: Promotion
//    var icon: String = "xmark"
//    var onDelete: ()->()
//    
//    // MARK: Animation Properties
//    @State var offsetX: CGFloat = 0
//    @State var cardOffset: CGFloat = 0
//    @State var finishAnimation: Bool = false
//    
//    var body: some View{
//        let cardWidth = screenSize().width - 35
//        let progress = (-offsetX * 0.8) / screenSize().width
//        
//        ZStack(alignment: .trailing) {
//            CanvasView()
//            
//            HStack{
//                VStack(alignment: .leading, spacing: 12) {
//                    HStack{
//                        Image(promotion.image)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 82, height: 82)
//                        
//                        Spacer()
//                        
//                        Text(promotion.title)
//                            .foregroundColor(.black.opacity(0.8))
//                        
// 
//                        
//                        Spacer()
//                    }
//                    
//                    
//
//                }
//                .lineLimit(1)
//                
//                Text(promotion.price)
//                    .font(.callout)
//                    .fontWeight(.bold)
//                    .foregroundColor(Color("color1").opacity(0.7))
//            }
//            .padding(.horizontal,15)
//            .padding(.vertical,10)
//            .frame(minHeight: 100)
//            .background {
//                RoundedRectangle(cornerRadius: 15, style: .continuous)
//                    .fill(.white.opacity(0.7))
//            }
//            .opacity(1.0 - progress)
//            .blur(radius: progress * 5.0)
//            .padding(.horizontal,15)
//            .contentShape(Rectangle())
//            .offset(x: cardOffset)
//            .gesture(
//                DragGesture()
//                    .onChanged({ value in
//                        // MARK: Only Left Swipe
//                        var translation = value.translation.width
//                        translation = (translation > 0 ? 0: translation)
//                        // MARK: Stopping the Card End
//                        translation = (-translation < cardWidth ? translation : -cardWidth)
//                        offsetX = translation
//                        cardOffset = offsetX
//                    }).onEnded({ value in
//                        // MARK: Release Animation
//                        if -value.translation.width > (screenSize().width * 0.6){
//                            // MARK: Haptic Feedback
//                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
//                            finishAnimation = true
//                            
//                            // Moving Card Outside Of the Screen
//                            withAnimation(.easeInOut(duration: 0.3)){
//                                cardOffset = -screenSize().width
//                            }
//                            
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
//                                onDelete()
//                            }
//                        }else{
//                            withAnimation(.easeInOut(duration: 0.3)){
//                                offsetX = .zero
//                                cardOffset = .zero
//                            }
//                        }
//                    })
//            )
//        }
//    }
//    
//    // MARK: Implementing Gooey Cell Animation
//    // For More About Fluid Animation
//    // Check out My Shape Morphing Video's, Link in the Description
//    @ViewBuilder
//    func CanvasView()->some View{
//        let width = (screenSize().width * 0.8)
//        let circleOffset = (offsetX / width)
//        
//        Canvas { ctx, size in
//            // Since We Applied Effect Here, It will be Smooth
//            ctx.addFilter(.alphaThreshold(min: 0.5,color: Color("Green")))
//            ctx.addFilter(.blur(radius: 6))
//            
//            ctx.drawLayer { layer in
//                if let resolvedView = ctx.resolveSymbol(id: 1){
//                    layer.draw(resolvedView, at: CGPoint(x: size.width / 2, y: size.height / 2))
//                }
//            }
//        } symbols: {
//            GooeyView()
//                .tag(1)
//        }
//        // MARK: Icon View
//        .overlay(alignment: .trailing) {
//            Image(systemName: icon)
//                .fontWeight(.semibold)
//                .foregroundColor(.white)
//                .frame(width: 42, height: 42)
//                .offset(x: 42)
//                .offset(x: (-circleOffset < 1.0 ? circleOffset : -1.0) * 42)
//                .offset(x: offsetX * 0.2)
//                .offset(x: 8)
//                .offset(x: finishAnimation ? -200 : 0)
//                .opacity(finishAnimation ? 0 : 1)
//                .animation(.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1), value: finishAnimation)
//        }
//    }
//    
//    @ViewBuilder
//    func GooeyView()->some View{
//        let width = (screenSize().width * 0.8)
//        let scale = finishAnimation ? -0.0001 : (offsetX / width)
//        let circleOffset = (offsetX / width)
//        
//        Image("Shape")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(height: 100)
//            .scaleEffect(x: -scale,anchor: .trailing)
//            // MARK: Adding Some Y Scaling
//            .scaleEffect(y: 1 + (-scale / 5),anchor: .center)
//            // MARK: Adding Icon View
//            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6), value: finishAnimation)
//            .overlay(alignment: .trailing, content: {
//                Circle()
//                    .frame(width: 42, height: 42)
//                    // MARK: Moving View Inside
//                    .offset(x: 42)
//                    .scaleEffect(finishAnimation ? 0.001 : 1, anchor: .leading)
//                    .offset(x: (-circleOffset < 1.0 ? circleOffset : -1.0) * 42)
//                    .offset(x: offsetX * 0.2)
//                    .offset(x: finishAnimation ? -200 : 0)
//                    .animation(.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1), value: finishAnimation)
//            })
//            .frame(maxWidth: .infinity,alignment: .trailing)
//            .offset(x: 8)
//    }
//}
//
//extension View{
//    func screenSize()->CGSize{
//        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
//            return .zero
//        }
//        
//        return window.screen.bounds.size
//    }
//}
