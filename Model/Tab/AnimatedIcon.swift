//
//  AnimatedIcon.swift
//  Taico
//
//  Created by 하명관 on 2022/10/18.
//

import SwiftUI
import Lottie

// Mark: Animated Icons Model
struct AnimatedIcon: Identifiable{
    var id: String = UUID().uuidString
    var tabIcon: BottomTab
    var lottieView: AnimationView
}   // 각각 고유의 아이디를 만들어주고 Lottie의 AnimationView를 사용하여 애니메이션을 이용
