//
//  Tea.swift
//  Taico
//
//  Created by 하명관 on 2022/10/24.
//


import SwiftUI

struct Tea: Identifiable,Hashable{
    var id: String = UUID().uuidString
    var title: String
    var price: String
    var image: String
}

var teas: [Tea] = [
    .init(title: "티", price: "3000원", image: "티"),
    .init(title: "티", price: "3000원", image: "티"),
    .init(title: "티", price: "3000원", image: "티"),
    .init(title: "티", price: "3000원", image: "티"),
    .init(title: "티", price: "3000원", image: "티")
]
