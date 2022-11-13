//
//  HomeViewModel.swift
//  Taico
//
//  Created by 하명관 on 2022/11/08.
//

import SwiftUI

// Using Combine to monitor search field and if user leaves for .5 secs then starts searching...
// to avoid memory issue...
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var productType: ProductType = .커피
    
    // Sample Products...
    @Published var products: [Product] = [
        
        .init(type: .커피, title: "아메리카노", subtitle: "Iced Caffe Americano", describe: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 타이코의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피", price: "2500원", productImage: "아이스아메리카노"),
        .init(type: .커피, title: "카라멜 마키아또", subtitle: "Iced Caramel Macchiato", describe: "향긋한 바닐라 시럽과 시원한 우유와 얼음을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료", price: "3000원", productImage: "카라멜마끼야또"),
        .init(type: .커피, title: "카푸치노", subtitle: "Iced Cappuccino", describe: "풍부하고 진한 에스프레소에 신선한 우유와 우유 거품이 얼음과 함께 들어간 시원하고 부드러운 커피 음료", price: "3000원", productImage: "카푸치노"),
        .init(type: .커피, title: "카페 라떼", subtitle: "Iced Caffe Latte", describe: "풍부하고 진한 농도의 에스프레소가 시원한 우유와 얼음을 만나 고소함과 시원함을 즐길 수 있는 대표적인 커피 라떼", price: "300원", productImage: "아이스카페라떼"),
        .init(type: .차, title: "캐모마일", subtitle: "Iced Aurora Chamomile Tea Relaxer", describe: "크리스마스 밤을 아름답게 물들이는 듯한 오로라가 살포시 내려앉아,홀리데이 시즌을 더욱 설레게 만들어 주는 음료 달콤한 리치과육이 들어간 베이스에 은은한 캐모마일과 유스베리티가 조화롭게 어우러진 릴렉싱 티 음료", price: "4000원", productImage: "캐모마일"),
        .init(type: .차, title: "얼 그레이 티", subtitle: "Iced Earl Grey Brewed Tea", describe: "꽃향 가득한 라벤더와 베르가못 향이 진한 홍차와 블렌딩된 향긋한 블랙 티", price: "3000원", productImage: "얼그레이티"),
        .init(type: .차, title:"유자 민트 티", subtitle: "Yuja Mint Tea", describe: "꽃달콤한 국내산 고흥 유자와 알싸하고 은은한 진저와 상쾌한 민트 티가 조화로운 유자 민트 티", price: "3000원", productImage: "유자"),
        .init(type: .차, title:"히비스커스 블렌드 티", subtitle: "Hibiscus Blend Brewed Tea", describe: "히비스커스, 사과, 파파야, 망고, 레몬그라스 등이 블렌딩된 상큼한 허브 티", price: "3500원", productImage: "히비스커스"),
                .init(type: .프라푸치노, title: "모카 프라푸치노", subtitle: "Moca Frappuccino", describe: "초콜릿과 커피가 어우러진 프라푸치노", price: "4000원", productImage: "모카"),
        .init(type: .프라푸치노, title: "자바칩 프라푸치노", subtitle: "Java Chip Frappuccino", describe: "커피, 모카 소스, 진한 초콜릿 칩이 입안 가득 느껴지는 타이코에서만 맛볼 수 있는 프라푸치노", price: "4000원", productImage: "자바칩"),
        .init(type: .프라푸치노, title: "카라멜 프라푸치노", subtitle: "Caramel Frappuccino", describe: "카라멜과 커피가 어우러진 프라푸치노", price: "4000원", productImage: "카라멜"),
        .init(type: .프라푸치노, title: "바닐라 프라푸치노", subtitle: "Vanilla Cream Frappuccino", describe: "신선한 우유와 바닐라 시럽이 어우러진 크림 프라푸치노", price: "4000원", productImage: "바닐라"),            .init(type: .블렌디드, title: "망고블렌디드", subtitle: "Jeju Tangerine Carrot Snowing Blended", describe: "망고 패션 프루트 주스와 블랙 티가 깔끔하게 어우러진 과일 블렌디드", price: "3000원", productImage: "망고블렌디드"),
        .init(type: .블렌디드, title: "딸기 블렌디드", subtitle: "Jeju Tangerine Carrot Snowing Blended", describe: "유산균이 살아있는 리얼 요거트와 풍성한 딸기 과육이 더욱 상큼하게 어우러진 과일 요거트 블렌디드", price: "3000원", productImage: "딸기블렌디드"),
        .init(type: .블렌디드, title: "바나나 블렌디드", subtitle: "Banana Blended", describe: " 인기 음료인 망고 패션후르츠 블렌디드에 신선한 바나나 1개가 통째로 들어간 달콤한 프라푸치노", price: "3000원", productImage: "바나나블렌디드"),
        .init(type: .블렌디드, title: "감귤 블렌디드", subtitle: "Jeju Tangerine Carrot Snowing Blended", describe: "눈 속에 쌓인 당근처럼 특색 있는 비주얼과 함께 제주산 감귤, 당근 등 다양한 과일을 이용하여 누구나 맛있게 즐길 수 있는 요거트 음료", price: "3000원", productImage: "감귤블렌디드")
    ]
    
    // Filtered Products...
    @Published var filteredProducts: [Product] = []
    
    // More products on the type..
    @Published var showMoreProductsOnType: Bool = false
    
    // Search Data...
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    @Published var searchedProducts: [Product]?
    
    var searchCancellable: AnyCancellable?
    
    init(){
        filterProductByType()
        
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                if str != ""{
                    self.filterProductBySearch()
                }
                else{
                    self.searchedProducts = nil
                }
            })
    }
    
    func filterProductByType(){
        
        // Filtering Product By Product Type...
        DispatchQueue.global(qos: .userInteractive).async {
            
            let results = self.products
            // Since it will require more memory so were using lazy to perform more...
                .lazy
                .filter { product in
                    
                    return product.type == self.productType
                }
            // Limiting result...
                .prefix(4)
            
            DispatchQueue.main.async {
                
                self.filteredProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
    
    func filterProductBySearch(){
        
        // Filtering Product By Product Type...
        DispatchQueue.global(qos: .userInteractive).async {
            
            let results = self.products
            // Since it will require more memory so were using lazy to perform more...
                .lazy
                .filter { product in
                    
                    return product.title.lowercased().contains(self.searchText.lowercased())
                }
            
            DispatchQueue.main.async {
                
                self.searchedProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
}
