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
}


var blogs: [BlogModel] = [
    BlogModel(image: "image1", category: "구매이벤트", heading: "지금 온라인 스토어에서 5만원 이상 구매시 다회용백을 드려요", author: "TAICO"),
    BlogModel(image: "image2", category: "할로윈", heading: "할로윈파티에 초대합니다.", author: "TAICO"),
    BlogModel(image: "image3", category: "협업이벤트", heading: "융합소프트웨어 X TAICO 콜라보", author: "TAICO"),
    BlogModel(image: "image4", category: "SwiftUI", heading: "지도", author: "하명관"),
    BlogModel(image: "image5", category: "SwiftUI", heading: "배달의 민족 로그인페이지", author: "하명관")
]
