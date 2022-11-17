//
//  BlogModel.swift
//  Taico
//
//  Created by 하명관 on 2022/10/19.
//

import SwiftUI

struct BlogModel: Identifiable {
    var id = UUID().uuidString
    var image: String
    var category: String
    var heading: String
    var author: String
    var site: String
}


var blogs: [BlogModel] = [
    BlogModel(image: "image1", category: "구매 이벤트", heading: "지금 온라인 스토어에서 5만원 이상 구매시 다회용백을 드려요", author: "TAICO",site:"https://image.istarbucks.co.kr/img/event/2022/wn_kbpay_221110.jpg"),
    BlogModel(image: "image2", category: "카드 이벤트", heading: "현대카드 11월 한정 혜택", author: "TAICO", site: "https://www.starbucks.co.kr/plcc/promotionView.do?eventCode=STH02"),
    BlogModel(image: "image3", category: "바리스타 추천", heading: "AUTUMN BARISTA FAVORITES", author: "TAICO",site: "https://www.starbucks.co.kr/whats_new/campaign_view.do?pro_seq=2060&menu_cd="),
    BlogModel(image: "image4", category: "적립 이벤트", heading: "온라인 스토어 별 2배 적립 혜택", author: "TAICO",site: "https://www.starbucks.co.kr/whats_new/campaign_view.do?pro_seq=2029&menu_cd="),
    BlogModel(image: "image5", category: "프로모션", heading: "S.I.VILLAGE 제휴 프로모션", author: "TAICO",site:"https://www.starbucks.co.kr/whats_new/campaign_view.do?pro_seq=2045&menu_cd=")
]
