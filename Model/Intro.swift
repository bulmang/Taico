//
//  Intro.swift
//  Taico
//
//  Created by 하명관 on 2022/11/16.
//

import SwiftUI

struct Intro: Identifiable{
    var id: String = UUID().uuidString
    var imageName: String
    var title: String
    var subtitle: String
}

var intros: [Intro] = [
    .init(imageName: "intro1", title: "쉽고 편리한\n스마트 오더",subtitle:"이제 매장에서 나만의 메뉴를 모바일로 쉽게 주문할 수 있어요!"),
    .init(imageName: "intro2", title: "맛있는 음료들", subtitle: "다양하고 맛있는 음료들을 시켜보세요!"),
    .init(imageName: "intro3", title: "편리한 카드 사용", subtitle: "TAICO 카드를 등록하여 편리한 결제를 해보세요!")
]


let dummyText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum is dummy text."
