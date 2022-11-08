//
//  Product.swift
//  Taico
//
//  Created by 하명관 on 2022/11/08.
//

import SwiftUI

// Product Model....
struct Product: Identifiable,Hashable {
    var id = UUID().uuidString
    var type: ProductType
    var title: String
    var subtitle: String
    var description: String = ""
    var price: String
    var productImage: String = ""
    var quantity: Int = 1
}

// Product Types...
enum ProductType: String,CaseIterable{
    case 커피 = "커피"
    case 차 = "차"
    case 스무디 = "스무디"
    case 버블티 = "버블티"
}
