//
//  OrderViewModel.swift
//  Taico
//
//  Created by 하명관 on 2022/10/31.
//

import SwiftUI

class OrderViewModel: ObservableObject {

    @Published var showCart = false
    @Published var selectedSize = ""
    
    // Animation Properties...
    @Published var startAnimation = false
    @Published var shoeAnimation = false
    
    @Published var showBag = false
    @Published var saveCart = false
    
    @Published var additemtocart = false
    
    @Published var endAnimation = false
    
    // cart items...
    @Published var cartItems = 0
    @Published var scoreItems = 1
    
    
    // performing Animations...
    func performAnimations(){
        
        withAnimation(.easeOut(duration: 0.8)){
            shoeAnimation.toggle()
        }
        
        // chain Animations...
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            
            withAnimation(.easeInOut){
                self.showBag.toggle()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            
            withAnimation(.easeInOut(duration: 0.5)){
                self.saveCart.toggle()
            }
        }
        
        // 0.75 + 0.5 = 1.25
        // beecause to start animation before the shoe comes to cart...
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
            
            self.additemtocart.toggle()
        }
        
        // end animation will start at 1.25....
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
            
            withAnimation(.easeInOut(duration: 0.5)){
                self.endAnimation.toggle()
            }
        }
    }
    
    func resetAll(){
        
        // giving some time to finish animations..
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {[self] in
            
            withAnimation{
                showCart.toggle()
            }
            
            startAnimation = false
            endAnimation = false
            selectedSize = ""
            additemtocart = false
            showBag = false
            shoeAnimation = false
            saveCart = false
            cartItems += scoreItems
            scoreItems = 1
        }
    }
}

