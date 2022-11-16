//
//  ContentView.swift
//  Taico
//
//  Created by 하명관 on 2022/10/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        IntroView()
            .overlay(SplashScreen())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
