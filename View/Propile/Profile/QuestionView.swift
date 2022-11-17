//
//  QuestionView.swift
//  Taico
//
//  Created by 하명관 on 2022/11/15.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    @State var offset: CGFloat = 0
    
    @State var showCapsule = true
    
    var body: some View {
        
        NavigationView{
            
            VStack(spacing: 10){
                
                HStack{
                    
                    Button {
                        // Closing View...
                        withAnimation(.easeInOut){
                            sharedData.showQueston = false
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .font(.title2)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    Text("주문")
                        .foregroundColor(.white)
                        .font(.system(size: 20,weight: .bold))
                        .fontWeight(.semibold)
                        .padding(.trailing)
                    
                    Spacer()
                    Button {
                        
                    } label: {
                        Image("Liked")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            
                    }.opacity(0)


                }
                .padding()
                .background{
                    Color("color2")
                        .ignoresSafeArea()
                }
                
                
                GeometryReader{proxy in
                    
                    let rect = proxy.frame(in: .global)
                    
                    ScrollableTabBar(tabs: tabs, rect: rect, offset: $offset) {
                        
                        HStack(spacing: 0){
                            
                            ForEach(image_URLs.indices,id: \.self){index in
                                
                                Image(image_URLs[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: rect.width)
                                    .frame(height: 650)
                                // Again Bug So Use CornerRadius...
                                    .cornerRadius(0)
                                    .padding(.top,200)
        //                            .overlay(Color.black.opacity(0.3))
                            }
                        }
                        .ignoresSafeArea()
                    }
                }
                .ignoresSafeArea()
                .overlay(
                
                    // Tab Bar....
                    TabBar(offset: $offset,showCapsule: $showCapsule),
                    alignment: .top
                )
                
            }

        }
        .navigationBarHidden(true)
        

//        .overlay(
//
//            // Enlarge Capsule Button...
//            Button(action: {
//                withAnimation{showCapsule.toggle()}
//            }, label: {
//
//                Image(systemName: "fiberchannel")
//                    .font(.title2)
//                    .padding()
//                    .background(Color("lightblue"))
//                    .foregroundColor(.black)
//                    .clipShape(Circle())
//            })
//            .padding()
//
//            ,alignment: .bottomTrailing
//        )
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

var tabs = ["FAQ","문의하기","문의내역"]

struct ScrollableTabBar<Content: View>: UIViewRepresentable {

    // to store our SwiftUI View...
    var content: Content
    
    // Getting Rect To Calculate Width And Height Of ScrollView...
    
    var rect: CGRect
    
    // ContentOffset...
    @Binding var offset: CGFloat
    
    // Tabs...
    var tabs: [Any]
    
    // ScrollView...
    // For Paging AKA Scrollable Tabs...
    let scrollView = UIScrollView()
    
    init(tabs: [Any],rect: CGRect,offset: Binding<CGFloat>,@ViewBuilder content: ()->Content) {
        
        self.content = content()
        self._offset = offset
        self.rect = rect
        self.tabs = tabs
    }
    
    func makeCoordinator() -> Coordinator {
        return ScrollableTabBar.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) ->  UIScrollView {
        
        setUpScrollView()
        // setting Content Size...
        
        scrollView.contentSize = CGSize(width: rect.width * CGFloat(tabs.count), height: rect.height)
        
        scrollView.addSubview(extractView())
        
        scrollView.delegate = context.coordinator
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        // Updating View...
        if uiView.contentOffset.x != offset{
            
            // Animating...
            // The ANimation Glitch Is Because It s Updating On Two Times...

            // Simple....
            // Removing Delegate While Animating...
            
            uiView.delegate = nil
            
            UIView.animate(withDuration: 0.4) {
                uiView.contentOffset.x = offset
            } completion: { (status) in
                if status{uiView.delegate = context.coordinator}
            }

        }
    }
    
    // setting Up ScrollView...
    func setUpScrollView(){
        
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    // Extracting SwiftUI View...
    func extractView()->UIView{
        
        // since it depends upon tab size..
        // so we getting tabs also...
        
        let controller = UIHostingController(rootView: content)
        controller.view.frame = CGRect(x: 0, y: 0, width: rect.width * CGFloat(tabs.count), height: rect.height)
        
        return controller.view!
    }
    
    // Delegate Function To Get Offset...
    
    class Coordinator: NSObject,UIScrollViewDelegate{
        
        var parent: ScrollableTabBar
        
        init(parent: ScrollableTabBar) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            parent.offset = scrollView.contentOffset.x
        }
    }
}

struct TabBar: View {
    
    @Binding var offset: CGFloat
    @Binding var showCapsule: Bool
    @State var width : CGFloat = 0
    
    var body: some View {
        
        GeometryReader{proxy -> AnyView in
            
            // Equal Width...
            let equalWidth = proxy.frame(in: .global).width / CGFloat(tabs.count)
            
            DispatchQueue.main.async {
                self.width = equalWidth
            }
            
            return AnyView(
            
                ZStack(alignment: .bottomLeading, content: {
                    
                    Capsule()
                        .fill(Color("color2"))
                        .frame(width: equalWidth - 15, height: showCapsule ? 40 : 4)
                        .offset(x: getOffset() + 7)
                    
                    HStack(spacing: 0){
                        
                        ForEach(tabs.indices,id: \.self){index in
                            
                            Text(tabs[index])
                                .fontWeight(.bold)
                                .foregroundColor(showCapsule ? (getIndexFromOffset() == CGFloat(index) ? .white : .gray) : .gray)
                                .frame(width: equalWidth, height: 40)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    
                                    // Setting Offset....
                                    withAnimation{
                                        
                                        offset = UIScreen.main.bounds.width * CGFloat(index)
                                    }
                                }
                        }
                    }
                    
                })
                .frame(maxWidth: .infinity,maxHeight: 40, alignment: .center)
                .clipShape(Capsule())
            )
        }
        .padding()
        .frame(height: 40)
    }
    
    // Calculating Offset...
    
    func getOffset()->CGFloat{
        
        let progress = offset / UIScreen.main.bounds.width
        
        return progress * width
    }
    
    func getIndexFromOffset()->CGFloat{
        
        let indexFloat = offset / UIScreen.main.bounds.width
        
        return indexFloat.rounded(.toNearestOrAwayFromZero)
    }
}

let image_URLs = [

    "question 3",
    "question 1",
    "question 2",
]
