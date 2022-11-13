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
    
    @State var discount: Bool = false
    
    
    var body: some View {
        
        
        NavigationView{
            
            VStack(spacing: 10){
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack{
                        
                        
                        PayView()
                            
                            


                        
                        
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
                            
                            Text("\(self.userSetting.score)")
                                .font(.custom(customFont, size: 15).bold())
                                .foregroundColor(Color("color1"))
                        }
                        .padding(.top)
                        
                        HStack{
                            
                            Text("총 결제금액")
                                .font(.custom(customFont, size: 20))
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Text(sharedData.getResultPrice())
                                .font(.custom(customFont, size: 20).bold())
                                .foregroundColor(Color("color1"))
                        }
                        .padding(.top)

                        
                        Button {
                            
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
}



//struct CartPayView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartPayView()
//    }
//}
class UserSetting: ObservableObject{
    
    @Published var score : Int = 0
    
    
    
}
