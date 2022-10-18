//
//  Tab.swift
//  CafeApp
//
//  Created by 하명관 on 2022/10/15.
//

import SwiftUI

// Tab Model 과 Sample Data

struct Tab: Identifiable {
    var id: String = UUID().uuidString
    var tabImage: String
    var tabName: String
    var tabOffset: CGSize
}

var tabs: [Tab] = [
    .init(tabImage: "티", tabName: "Hot\nCoffee", tabOffset: CGSize(width: 0, height: -40)),
    .init(tabImage: "커피", tabName: "Frappo", tabOffset: CGSize(width: 0, height: -40)),
    .init(tabImage: "스무디", tabName: "Ice Cream", tabOffset: CGSize(width: 0, height: -40)),
    .init(tabImage: "버블티", tabName: "Waffles", tabOffset: CGSize(width: 0, height: -40)),
]
