//
//  SharedDataModel.swift
//  Taico
//
//  Created by 하명관 on 2022/11/08.
//

import SwiftUI

class SharedDataModel: ObservableObject {
    
    // Detail Product Data....
    @Published var detailProduct: Product?
    
    @Published var showDetailProduct: Bool = false
    
    @Published var showQueston: Bool = false
    
    @Published var showAgree: Bool = false
    
    @Published var showDeposit: Bool = false
    
    @Published var showCardMoney: Bool = false
    
    @Published var blog1: Bool = false
    
    @Published var blog2: Bool = false
    @Published var blog3: Bool = false
    @Published var blog4: Bool = false
    @Published var blog5: Bool = false
    
    
    @Published var CardPay: Bool = false
    
    
    @Published var showPay: Bool = false
    
    // matched Geoemtry Effect from Search page...
    @Published var fromSearchPage: Bool = false
    
    // Liked Products...
    @Published var likedProducts: [Product] = []
    
    @Published var orderProducts: [Product] = []
    
    // basket Products...
    @Published var cartProducts: [Product] = []
    
    // calculating Total price...
    func getTotalPrice()->String{
        
        var total: Int = 0
        
        cartProducts.forEach { product in
            
            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
            
            let quantity = product.quantity
            let priceTotal = quantity * price.integerValue
            
            total += priceTotal
        }
        
        return "\(total)원"
    }
    func getResultPrice()->String{
        
        @ObservedObject var userSetting = UserSetting()
        
        var result: Int = 0
        
        var end: Int = 0
        
        cartProducts.forEach { product in
            
            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
            
            let quantity = product.quantity
            let priceTotal = quantity * price.integerValue
            
            result += priceTotal
        }
        
        end = result - userSetting.score
        
        return "\(end)원"
    }
    
    func getDiscountPrice()->String{
        
        @ObservedObject var userSetting = UserSetting()
        
        var result: Int = 0
        
        var end: Int = 0
        
        var discount: Int = 0
        
        cartProducts.forEach { product in
            
            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
            
            let quantity = product.quantity
            let priceTotal = quantity * price.integerValue
            
            result += priceTotal
            
            
        }
        discount = result / 10
        end = result - discount
        
        return "\(end)원"
    }
    
    func getCardPrice()->String{
        
        @ObservedObject var userSetting = UserSetting()
        
        var result: Int = 0
        
        var end: Int = 0
        
        var discount: Int = 0
        
        var cardprice1: Int = 50000
        
        var cardprice: Int = 0
        
        cartProducts.forEach { product in
            
            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
            
            let quantity = product.quantity
            let priceTotal = quantity * price.integerValue
            
            result += priceTotal
            
            
        }
        discount = result / 10
        end = result - discount
        cardprice = cardprice1 - end
        
        return "\(cardprice)원"
    }
    
    func Discount()->String{
        
        @ObservedObject var userSetting = UserSetting()
        
        var result: Int = 0
        
        
        
        var discount: Int = 0
        
        cartProducts.forEach { product in
            
            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
            
            let quantity = product.quantity
            let priceTotal = quantity * price.integerValue
            
            result += priceTotal
            
            
        }
        discount = result / 10
        
        
        return "\(discount)원"
    }
}


