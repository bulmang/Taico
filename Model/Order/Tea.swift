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
    .init(title: "우롱티", price: "3000원", image: "우롱티"),
    .init(title: "얼그레이티", price: "3000원", image: "얼그레이티"),
    .init(title: "블랙티", price: "3000원", image: "블랙티"),
    .init(title: "쟈스민그린티", price: "3000원", image: "쟈스민그린티")
]
