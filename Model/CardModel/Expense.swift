//
//  Expense.swift
//  ComplexMatchedGeometry
//
//  Created by Balaji on 23/08/22.
//

import SwiftUI

// MARK: Expense Model With Sample Data
struct Expense: Identifiable{
    var id = UUID().uuidString
    var amountSpent: String
    var product: String
    var productIcon: String
    var spendType: String
}

var expenses: [Expense] = [
    Expense(amountSpent: "4000원", product: "캐모마일", productIcon: "Youtube", spendType: "Iced Aurora Chamomile Tea Relaxer"),
    Expense(amountSpent: "3000원", product: "감귤 블렌디드", productIcon: "Amazon", spendType: "Jeju Tangerine Carrot Snowing Blended"),
    Expense(amountSpent: "3000원", product: "딸기 블렌디드", productIcon: "Apple", spendType: "Strawberry Delight Yogurt Blended"),
    Expense(amountSpent: "3000원", product: "카페라떼", productIcon: "Patreon", spendType: "Iced Caffe Latte"),
    Expense(amountSpent: "4000원", product: "모카 프라푸치노", productIcon: "Dribbble", spendType: "Moca Frappuccino"),
    Expense(amountSpent: "4000원", product: "카라멜 프라푸치노", productIcon: "Instagram", spendType: "Caramel Frappuccino"),
    Expense(amountSpent: "2500원", product: "아메리카노", productIcon: "Netflix", spendType: "Iced Caffe Americano"),
    Expense(amountSpent: "3000원", product: "카라멜 마끼아또", productIcon: "Photoshop", spendType: "Iced Caramel Macchiato"),
    Expense(amountSpent: "4000원", product: "바닐라 프라푸치노", productIcon: "Figma", spendType: "Vanilla Cream Frappuccino"),
]
