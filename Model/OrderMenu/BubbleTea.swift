//
//  BubbleTea.swift
//  Taico
//
//  Created by 하명관 on 2022/10/24.
//

import SwiftUI

struct BubbleTea: Identifiable,Hashable{
    var id: String = UUID().uuidString
    var title: String
    var price: String
    var image: String
}

var bubbleteas: [BubbleTea] = [
    .init(title: "버블티", price: "3000원", image: "버블티"),
    .init(title: "버블티", price: "3000원", image: "버블티"),
    .init(title: "버블티", price: "3000원", image: "버블티"),
    .init(title: "버블티", price: "3000원", image: "버블티"),
    .init(title: "버블티", price: "3000원", image: "버블티")
]
