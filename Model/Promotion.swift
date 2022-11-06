//
//  Promotion.swift
//  Taico
//
//  Created by 하명관 on 2022/11/06.
//

import SwiftUI

import SwiftUI

// MARK: Promotion Model
struct Promotion: Identifiable{
    var id: String = UUID().uuidString
    var title: String
    var price: String
    var image: String
}


