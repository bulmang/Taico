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
    BlogModel(image: "image1", category: "SwiftUI", heading: "디즈니 스플래쉬 스크린", author: "하명관"),
    BlogModel(image: "image2", category: "SwiftUI", heading: "로그인&회원가입", author: "하명관"),
    BlogModel(image: "image3", category: "SwiftUI", heading: "3D 신발 보기", author: "하명관"),
    BlogModel(image: "image4", category: "SwiftUI", heading: "지도", author: "하명관"),
    BlogModel(image: "image5", category: "SwiftUI", heading: "배달의 민족 로그인페이지", author: "하명관")
]
