//
//  Card.swift
//  Taico
//
//  Created by 하명관 on 2022/10/21.
//


import SwiftUI

struct Card: View {
    // MARK: GlassMorphism Properties
    @State var blurView: UIVisualEffectView = .init()
    @State var defaultBlurRadius: CGFloat = 0
    @State var defaultSaturationAmount: CGFloat = 0
    
    @State var activateGlassMorphism: Bool = false
    var body: some View {
        ZStack{
            
            NeuromorphicUI {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 400, height: 450)
                            .offset(y:-50)
                    }.ignoresSafeArea()

            VStack(spacing: 10){
                
                Text("Pay")
                    .font(.system(size: 50))
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom,90)
                    
            
                
                GlassMorphicCard()
                    .frame(maxWidth: .infinity)
                    .padding(.bottom)
                
                Text("Taico 카드를 등록하셨습니다.")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    
                
                // MARK: Slider to show Demo
                Toggle("카드 활성화", isOn: $activateGlassMorphism)
                    .font(.title3)
                    .onChange(of: activateGlassMorphism) { newValue in
                        // Changing Blur Radius And Saturation
                        blurView.gaussianBlurRadius = (activateGlassMorphism ? 10 : defaultBlurRadius)
                        blurView.saturationAmount = (activateGlassMorphism ? 1.8 : defaultSaturationAmount)
                    }
                    
                    .padding(.horizontal,25)
                                                                        

                
                Text("융합소프트웨어 X TAICO \n융합소프트웨어학과 10% 할인")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .background(
                        (Color("Color"))
                    .clipShape(Rectangle())
                    )
                    .padding(.top,90)
                    

                  

                
                
            }
            
            

        }
    }
    
    // MARK: GlassMorphism Card
    @ViewBuilder
    func GlassMorphicCard()->some View{
        ZStack{
            CustomBlurView(effect: .systemUltraThinMaterialDark) { view in
                blurView = view
                if defaultBlurRadius == 0{defaultBlurRadius = view.gaussianBlurRadius}
                if defaultSaturationAmount == 0{defaultSaturationAmount = view.saturationAmount}
            }
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            
            // MARK: Building Glassmorphic Card
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    .linearGradient(colors: [
                        .white.opacity(0.25),
                        .white.opacity(0.05),
                        .clear
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .blur(radius: 5)
            
            // MARK: Borders
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .stroke(
                    .linearGradient(colors: [
                        .white.opacity(0.6),
                        .clear,
                        .purple.opacity(0.2),
                        .purple.opacity(0.5)
                    ], startPoint: .topLeading, endPoint: .bottomTrailing),
                    lineWidth: 2
                )
        }
        // MARK: Shadows
        .shadow(color: .black.opacity(0.15), radius: 5, x: -10, y: 10)
        .shadow(color: .black.opacity(0.15), radius: 5, x: 10, y: -10)
        .overlay(content: {
            // MARK: Card Content
            CardContent()
                .opacity(activateGlassMorphism ? 1 : 0)
                .animation(.easeIn(duration: 0.5), value: activateGlassMorphism)
        })
        .padding(.horizontal,25)
        .frame(height: 220)
    }
    
    @ViewBuilder
    func CardContent()->some View{
        VStack(alignment: .leading, spacing: 12) {
            HStack{
//                Text("TAICO MEMBERSHIP")
//                    .modifier(CustomModifier(font: .callout))
//                    .font(.system(size: 20))
//                    .fontWeight(.bold)
                
                Image("barcode")
                    .resizable()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
            }
            .offset(y: -5)
            
            Spacer()
            
            Text("HA MYUNG KWAN")
                .modifier(CustomModifier(font: .title3))
                .fontWeight(.bold)
            
            Text("융합소프트웨어 2017121052")
                .modifier(CustomModifier(font: .callout))
                .fontWeight(.bold)
        }
        .padding(20)
        .padding(.vertical,10)
        .blendMode(.overlay)
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
    }
}

// MARK: Custom Modifier Since Most Of the Text Shares Same Modifiers
struct CustomModifier: ViewModifier{
    var font: Font
    func body(content: Content) -> some View {
        content
            .font(font)
            
            .foregroundColor(.black)
            .shadow(radius: 15)
            .frame(maxWidth: .infinity,alignment: .leading)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
    }
}

// MARK: Custom Blur View
// With The Help of UiVisualEffect View
struct CustomBlurView: UIViewRepresentable{
    var effect: UIBlurEffect.Style
    var onChange: (UIVisualEffectView)->()
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: effect))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        DispatchQueue.main.async {
            onChange(uiView)
        }
    }
}

// MARK: Adjusting Blur Radius in UIVisualEffectView
extension UIVisualEffectView{
    // MARK: Steps
    // Extracting Private Class BackDropView Class
    // Then From that View Extracting ViewEffects like Gaussian Blur & Saturation
    // With the Help of this We ca Achevie Glass Morphism
    var backDrop: UIView?{
        // PRIVATE CLASS
        return subView(forClass: NSClassFromString("_UIVisualEffectBackdropView"))
    }
    
    // MARK: Extracting Gaussian Blur From BackDropView
    var gaussianBlur: NSObject?{
        return backDrop?.value(key: "filters", filter: "gaussianBlur")
    }
    // MARK: Extracting Saturation From BackDropView
    var saturation: NSObject?{
        return backDrop?.value(key: "filters", filter: "colorSaturate")
    }
    
    // MARK: Updating Blur Radius And Saturation
    var gaussianBlurRadius: CGFloat{
        get{
            // MARK: We Know The Key For Gaussian Blur = "inputRadius"
            return gaussianBlur?.values?["inputRadius"] as? CGFloat ?? 0
        }
        set{
            gaussianBlur?.values?["inputRadius"] = newValue
            // Updating the Backdrop View with the New Filter Updates
            applyNewEffects()
        }
    }
    
    func applyNewEffects(){
        // MARK: Animating the Change
        UIVisualEffectView.animate(withDuration: 0.5) {
            self.backDrop?.perform(Selector(("applyRequestedFilterEffects")))
        }
    }
    
    var saturationAmount: CGFloat{
        get{
            // MARK: We Know The Key For Gaussian Blur = "inputAmount"
            return saturation?.values?["inputAmount"] as? CGFloat ?? 0
        }
        set{
            saturation?.values?["inputAmount"] = newValue
            applyNewEffects()
        }
    }
}


// MARK: Finding SubView for Class
extension UIView{
    func subView(forClass: AnyClass?)->UIView?{
        return subviews.first { view in
            type(of: view) == forClass
        }
    }
}

// MARK: Custom Key Filtering
extension NSObject{
    // MARK: Key Values From NSOBject
    var values: [String: Any]?{
        get{
            return value(forKeyPath: "requestedValues") as? [String: Any]
        }
        set{
            setValue(newValue, forKeyPath: "requestedValues")
        }
    }
    
    func value(key: String,filter: String)->NSObject?{
        (value(forKey: key) as? [NSObject])?.first(where: { obj in
            return obj.value(forKeyPath: "filterType") as? String == filter
        })
    }
}

struct NeuromorphicUI <Content : View> : View {
    let content : Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
      
            content
                .foregroundColor(Color("mainColor"))
                .shadow(color: Color("topLeftShadow"), radius: 5, x: -6, y: -6)
                .shadow(color: Color("bottomRightShadow"), radius: 5, x: 6, y: 6)
        }
    }
}
