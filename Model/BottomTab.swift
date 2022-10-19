//
//  BottomTab.swift
//  Taico
//
//  Created by 하명관 on 2022/10/18.
//

import SwiftUI

// Mark: Tab Model
enum BottomTab: String,CaseIterable{
    case home = "Home"
    case card = "in-card"
    case order = "571-black-tea-lineal"
    case shopping = "hover-shopping"
    case account = "Account"
} // json으로 불러온 움직이는 아이콘들을 가져와서 Tab에 저장
