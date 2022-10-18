//
//  ResizableLottieView.swift
//  Taico
//
//  Created by 하명관 on 2022/10/18.
//

import SwiftUI
import Lottie

//Mark : Resizable Lottie View
struct ResizableLottieView: UIViewRepresentable {
    var lottieView: AnimationView
    var color: SwiftUI.Color = .black
    
    func makeUIView(context: Context) -> UIView  {
        let view = UIView()
        view.backgroundColor = .clear
        addLottieView(to: view)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        //  색 업데이트
        // Finding Attached Lottie View
        if let animationView = uiView.subviews.first(where: { view in
            view is AnimationView
        }) as? AnimationView{
            // mark : finding keypaths with the help of log
            // key may be changed based on Lottie File
            // use log to find appropriate key
            //lottieView.logHierarchyKeypaths()
            
            
            let lottieColor = ColorValueProvider(UIColor(color).lottieColorValue)
            // Mark : Fill key Path
            let fillKeyPath = AnimationKeypath(keys: ["**","Fill 1","**","Color"])
            animationView.setValueProvider(lottieColor, keypath: fillKeyPath)
            
            // MARK: Stroke Key Path
            let strokeKeyPath = AnimationKeypath(keys: ["**","Fill 1","**","Color"])
            animationView.setValueProvider(lottieColor, keypath: strokeKeyPath)
        }
    }
    
    

    func addLottieView(to: UIView){
        /// mark: memory proerties
        lottieView.backgroundBehavior = .forceFinish
        lottieView.shouldRasterizeWhenIdle = true
        
        lottieView.backgroundColor = .clear
        lottieView.contentMode = .scaleAspectFit
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            lottieView.widthAnchor.constraint(equalTo: to.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: to.heightAnchor)
        ]
        
        to.addSubview(lottieView)
        to.addConstraints(constraints)
    }
}
