//
//  Drink.swift
//  Taico
//
//  Created by 하명관 on 2022/10/17.
//

import SwiftUI

struct Drink: Identifiable,Hashable{
    var id: String = UUID().uuidString
    var title: String
    var price: String
    var image: String
}

var drinks: [Drink] = [
    .init(title: "아인슈페너", price: "3000원", image: "아인슈패너"),
    .init(title: "아인슈페너", price: "3000원", image: "아인슈패너"),
    .init(title: "아인슈페너", price: "3000원", image: "아인슈패너"),
    .init(title: "아인슈페너", price: "3000원", image: "아인슈패너"),
    .init(title: "아인슈페너", price: "3000원", image: "아인슈패너")
]
