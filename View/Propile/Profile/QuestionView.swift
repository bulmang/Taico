//
//  QuestionView.swift
//  Taico
//
//  Created by 하명관 on 2022/11/15.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        
        
        
        VStack{
            Text("고객의 소리")
                .font(.system(size: 30))
                .fontWeight(.heavy)
            
            ScrollView{

                
                Image("question")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }

                
        }
        

    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
