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
    Drink(title: "아메리카노", price: "3000원", image: "아메리카노"),
    Drink(title: "바닐라아메리카노", price: "3500원", image: "헤이즐넛아메리카노"),
    Drink(title: "헤이즐넛아메리카노", price: "3500원", image: "헤이즐넛아메리카노"),
    Drink(title: "카라멜마끼아또", price: "4000원", image: "카라멜마끼아또"),
    Drink(title: "카페라뗴", price: "4000원", image: "카페라떼")
]
