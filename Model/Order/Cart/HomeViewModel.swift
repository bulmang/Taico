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
    
        .init(type: .커피, title: "아메리카노", subtitle: "Series 6: Red", price: "2000원",productImage: "아메리카노"),
        .init(type: .커피, title: "카페라떼", subtitle: "A14 - Blue", price: "3000원", productImage: "카페라떼"),
        .init(type: .커피, title: "헤이즐넛 아메리카노", subtitle: "Gear: Black", price: "2500원", productImage: "헤이즐넛아메리카노"),
        .init(type: .커피, title: "카라멜 마끼야또", subtitle: "A15 - Pink", price: "3000원", productImage: "카라멜마끼야또"),        
        .init(type: .차, title: "블랙티", subtitle: "A13 - Purple", price: "3000원", productImage: "블랙티"),
        .init(type: .차, title: "얼그레이티", subtitle: "A13 - White", price: "3000원", productImage: "얼그레이티"),
        .init(type: .차, title: "우롱티", subtitle: "M1 - Gold", price: "3000원", productImage: "우롱티"),
        .init(type: .차, title: "쟈스민 그린티", subtitle: "M1 - Space Grey", price: "3000원", productImage: "쟈스민그린티"),
        .init(type: .스무디, title: "딸기 스무디", subtitle: "M1 - Silver", price: "3000원", productImage: "딸기스무디"),
        .init(type: .스무디, title: "오렌지 스무디", subtitle: "A14 - Pink", price: "3000원", productImage: "오렌지스무디"),
        .init(type: .스무디, title: "키위 스무디", subtitle: "A15 - Grey", price: "3000원", productImage: "키위스무디"),
        .init(type: .스무디, title: "망고 스무디", subtitle: "M1 - Purple", price: "3000원", productImage: "망고스무디"),
        .init(type: .버블티, title: "버블티", subtitle: "M1 - Purple", price: "3000원", productImage: "버블티")
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
