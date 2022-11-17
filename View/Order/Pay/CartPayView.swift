//
//  CartPayView.swift
//  Taico
//
//  Created by 하명관 on 2022/11/13.
//

import SwiftUI

struct CartPayView: View {
    
    
    @ObservedObject var userSetting = UserSetting()
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    
    
    // Delete Option...
    @State var showDeleteOption: Bool = false
    
    @Binding var childcartstate: Int
    
    @State var money: Int  = 50000
    
    
    
    @State var discount: Bool = true
    
    @State private var isShowingCoupone = false
    
    @State private var isShowingkt = false
    
    @State private var isShowingGift = false
    @State private var isShowing = false
    
    @State var ColorCard : Bool = true
    @State var ColorPay : Bool = false
    @State var ColorTaico : Bool = false
    
    @State var ColorCoupone: Bool = false
    
    @State var pay: Bool = false
    
    
    var body: some View {
        
        
        NavigationView{
            
            VStack(spacing: 10){
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack{
                        
                        
                        VStack(alignment: .leading){
                            
                            Text("결제하기")
                                .foregroundColor(.black)
                                .font(.system(size: 50))
                                .fontWeight(.heavy)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .padding(.horizontal)


                            
                            Text("결제수단")
                                .font(.system(size: 30))
                                .fontWeight(.semibold)
                                .padding()
                                .padding(.bottom, 10)
                            
                            
                            
                            
                            Button{
                                
                                ColorCard.toggle()
                                ColorPay = false
                                ColorTaico = false
                            
                            
                                
                            } label: {
                                
                                Label{
                                    Image(systemName: "creditcard.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                    
                                    Text("신용카드")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color(.black))
                                        .fontWeight(.bold)
                                }icon: {
                                    Circle()
                                        .fill(ColorCard ? Color("color2") : Color(.white))
                                        .frame(width: 10, height: 10)
                                        .overlay{
                                            Circle()
                                                .stroke(.black,lineWidth: 3)
                                                .frame(width: 20, height: 20)
                                        }
                                        .padding(.horizontal,20)
                                }
                                
                                
                            }
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.bottom, 40)
                            
                            Button{
                                
                                ColorPay.toggle()
                                ColorCard = false
                                ColorTaico = false
                                
                            } label: {
                                Label{
                                    Image(systemName: "p.square.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                    
                                    Text("카카오페이")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color(.black))
                                        .fontWeight(.bold)
                                }icon: {
                                    Circle()
                                        .fill(ColorPay ? Color("color2") : Color(.white))
                                        .frame(width: 10, height: 10)
                                        .overlay{
                                            Circle()
                                                .stroke(.black,lineWidth: 3)
                                                .frame(width: 20, height: 20)
                                        }
                                        .padding(.horizontal,20)
                                }
                                
                            }
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.bottom, 40)
                            
                            Button{
                                
                                ColorPay = false
                                ColorCard = false
                                ColorTaico.toggle()
                                
                            } label: {
                                Label{
                                    Image(systemName: "t.square.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                    
                                    Text("TAICO 카드")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color(.black))
                                        .fontWeight(.bold)
                                }icon: {
                                    Circle()
                                        .fill(ColorTaico ? Color("color2") : Color(.white))
                                        .frame(width: 10, height: 10)
                                        .overlay{
                                            Circle()
                                                .stroke(.black,lineWidth: 3)
                                                .frame(width: 20, height: 20)
                                        }
                                        .padding(.horizontal,20)
                                }
                                
                            }
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.bottom, 20)
                            
                            
                            .overlay (
                                Divider()
                                    .overlay(
                                        Color(.black).opacity(0.7)
                                    )
                                    .padding(.horizontal, 20)
                                    .offset(y : 0)
                                ,alignment: .bottom
                            )
                            
                            //                    .presentationDetents([.medium, .large])
                            
                            Text("쿠폰 및 할인")
                                .font(.system(size: 30))
                                .fontWeight(.semibold)
                                .padding()
                                .padding(.bottom, 10)
                            
                            Button{
                                
                                isShowingCoupone.toggle()
                                
                            }label: {
                                HStack{
                                    Image(systemName: "percent")
                                        .foregroundColor(.black)
                                        .font(.system(size: 25))
                                    
                                    Text("쿠폰")
                                        .foregroundColor(.black)
                                        .font(.system(size: 25))
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                        .font(.system(size: 25))
                                    
                                    
                                    
                                }
                                .padding()
                                
                                
                            }.sheet(isPresented: $isShowingCoupone){
                                VStack{
                                    Text("쿠폰")
                                        .foregroundColor(.black)
                                        .fontWeight(.heavy)
                                        .font(.system(size: 25))
                                        .padding()
                                    
                                    ZStack{
                                        
                                        NeuromorphicUI {
                                            
                                            RoundedRectangle(cornerRadius: 25)
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 180)
                                            
                                        }
                                        .padding()
                                        .ignoresSafeArea()
                                        HStack{
                                            
                                            Button{
                                                
                                                ColorCoupone.toggle()
                                                discount.toggle()
                                                
                                            } label: {
                                                
                                                VStack{

                                                        
                                                    
                                                    Text("10 쿠폰%")
                                                        .foregroundColor(.black)
                                                        .fontWeight(.heavy)
                                                        .font(.system(size: 30))
                                                        .offset(x:-80,y:-50)
                                                    
                                                    Text("융합소프트웨어학과 할인")
                                                        .foregroundColor(.black)
                                                        .fontWeight(.heavy)
                                                        .font(.system(size: 30))
                                                        .padding(.horizontal)
                                                }
                                                .frame(width: 335,height: 200)
                                                
                                                

                                            }
                                            .offset(y:30)
                                            
                                            Spacer()
                                            
                                            Circle()
                                                .fill(ColorCoupone ? Color("color2") : Color(.white))
                                                .frame(width: 20, height: 20)
                                                .overlay{
                                                    Circle()
                                                        .stroke(.black,lineWidth: 3)
                                                        .frame(width: 30, height: 30)
                                                }
                                                .padding(.horizontal,20)
                                                .offset(y:-40)
                                            
                                            
                                            
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                    }
                                    
                                    
                                    
                                    
                                    
                                    Spacer()
                                    
                                }
                                
                                .presentationDetents([ .fraction(0.90)])
                                .persistentSystemOverlays(.visible)
                            }
                            
                            Button{
                                isShowingGift.toggle()
                            }label: {
                                HStack{
                                    Image(systemName: "gift")
                                        .foregroundColor(.black)
                                        .font(.system(size: 25))
                                    
                                    Text("선물")
                                        .foregroundColor(.black)
                                        .font(.system(size: 25))
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                        .font(.system(size: 25))
                                    
                                    
                                    
                                }.sheet(isPresented: $isShowingGift){
                                    
                                    GiftView()
                                    .presentationDetents([ .fraction(0.90)])
                                    .persistentSystemOverlays(.visible)
                                }
                                .padding()
                                
                                
                                
                            }
                            Button{
                                
                                isShowingkt.toggle()
                                
                            }label: {
                                HStack{
                                    Image(systemName: "ipad.and.iphone")
                                        .foregroundColor(.black)
                                        .font(.system(size: 25))
                                    
                                    Text("통신사 제휴 할인")
                                        .foregroundColor(.black)
                                        .font(.system(size: 25))
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                        .font(.system(size: 25))
                                    
                                    
                                    
                                }
                                .padding()
                                
                                
                            }.sheet(isPresented: $isShowingkt){
                                VStack{
                                    
                                    Text("통신사 제휴 할인")
                                        .foregroundColor(.black)
                                        .fontWeight(.heavy)
                                        .font(.system(size: 25))
                                        .padding()
                                    
                                    Spacer()
                                    
                                    
                                    Text("통신사 할인 이벤트가 끝났습니다.")
                                        .foregroundColor(.black)
                                    
                                        .fontWeight(.semibold)
                                        .font(.system(size: 25))
                                        .padding()
                                    
                                    
                                    
                                    
                                    
                                    
                                    Spacer()
                                    
                                }
                                
                                .presentationDetents([ .fraction(0.90)])
                                .persistentSystemOverlays(.visible)
                            }
                            
                            Spacer()
                            
                            
                            
                            
                            
                            
                            
                        }
                            
                            


                        
                        
                        // checking if liked products are empty...
                        if sharedData.cartProducts.isEmpty{
                            
                            Group{
                                Image("NoBasket")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                    .padding(.top,35)
                                
                                Text("장바구니가 비어있습니다.")
                                    .font(.custom(customFont, size: 25))
                                    .fontWeight(.semibold)
                                
                                Text("원하는 메뉴를 장바구니에 담고 한번에 주문해보세요.")
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
                                ForEach($sharedData.cartProducts){$product in
                                    
                                    HStack(spacing: 0){
                                        
                                        if showDeleteOption{
                                            
                                            Button {
                                                deleteProduct(product: product)
                                                childcartstate -= 1
                                            } label: {
                                                Image(systemName: "minus.circle.fill")
                                                    .font(.title2)
                                                    .foregroundColor(.red)
                                            }
                                            .padding(.trailing)

                                        }
                                        
                                        
                                    }
                                }
                            }
                            .padding(.top,25)
                            .padding(.horizontal,10)
                        }
                    }
                    .padding()
                }
                
                // Showing Total and check out Button...
                if !sharedData.cartProducts.isEmpty{
                    
                    Group{
                        
                        
                        HStack{
                            
                            Text("결제금액")
                                .font(.custom(customFont, size: 15))
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text(sharedData.getTotalPrice())
                                .font(.custom(customFont, size: 15).bold())
                                .foregroundColor(Color("color1"))
                        }
                        
                        HStack{
                            
                            Text("할인")
                                .font(.custom(customFont, size: 15))
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Text(discount ? "\(self.userSetting.score)" : sharedData.Discount())
                                .font(.custom(customFont, size: 15).bold())
                                .foregroundColor(Color("color1"))
                        }
                        .padding(.top)
                        
                        HStack{
                            
                            Text("총 결제금액")
                                .font(.custom(customFont, size: 20))
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Text(discount ?sharedData.getResultPrice() :sharedData.getDiscountPrice())
                                .font(.custom(customFont, size: 20).bold())
                                .foregroundColor(Color("color1"))
                        }
                        .padding(.top)

                        
                        Button {
                            
                            self.pay = true
                            
                        } label: {
                            
                            Text("결제")
                                .font(.custom(customFont, size: 18).bold())
                                .foregroundColor(.white)
                                .padding(.vertical,18)
                                .frame(maxWidth: .infinity)
                                .background(Color("color1"))
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                        }
                        .padding(.vertical)
                        .alert("결제 되었습니다.", isPresented: $pay){
                            Button("확인", role: .cancel){
                                
                                
                                withAnimation(.easeInOut){
                                    sharedData.showDetailProduct = false
                                }
                                sharedData.showPay = false
                                sharedData.cartProducts.removeAll()
                                childcartstate = 0
                                
                                
                                
//                                addToOrder()
                            }
                        }
                    }
                    .padding(.horizontal,25)
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
    
    func deleteProduct(product: Product){
        
        if let index = sharedData.cartProducts.firstIndex(where: { currentProduct in
            return product.id == currentProduct.id
        }){
            
            let _ = withAnimation{
                // removing...
                sharedData.cartProducts.remove(at: index)
            }
        }
    }
    
//    func addToOrder(){
//
//        if let index = sharedData.orderProducts.firstIndex(where: { product in
//            return self.product.id == product.id
//        }){
//            // Remove from liked....
//            sharedData.orderProducts.remove(at: index)
//        }
//        else{
//            // add to liked
//            sharedData.orderProducts.append(product)
//        }
//    }
}



struct CartPayView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
class UserSetting: ObservableObject{
    
    @Published var score : Int = 0
    
    
    
}
