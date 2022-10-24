//
//  Smudi.swift
//  Taico
//
//  Created by 하명관 on 2022/10/24.
//

import SwiftUI

struct Smudi: Identifiable,Hashable{
    var id: String = UUID().uuidString
    var title: String
    var price: String
    var image: String
}

var smudis: [Smudi] = [
    .init(title: "스므디", price: "3000원", image: "스무디"),
    .init(title: "스므디", price: "3000원", image: "스무디"),
    .init(title: "스므디", price: "3000원", image: "스무디"),
    .init(title: "스므디", price: "3000원", image: "스무디"),
    .init(title: "스므디", price: "3000원", image: "스무디")
]
