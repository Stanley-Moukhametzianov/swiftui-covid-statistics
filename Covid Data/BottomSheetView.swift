//
//  BottomSheetView.swift
//  Covid Data
//
//  Created by Stanley Moukh on 7/24/21.
//

import SwiftUI



fileprivate enum Constants{
    static let radius: CGFloat = 16
    static let indicatorHeight: CGFloat = 6
    static let indicatorWidth : CGFloat = 60
    static let snapRatio: CGFloat = 0.25
    static let minHeightRatio: CGFloat = 0.2
    
    
}

struct BottomSheetView<Content: View>: View {
    @Binding var isOpen: Bool
    let maxHeight: CGFloat
    let minHeight: CGFloat
    let content: Content
    @GestureState private var translation : CGFloat = 0
    
    
    private var offset: CGFloat{
        isOpen ? 0 : maxHeight - minHeight
    }
    
    private var indicatior: some View{
        RoundedRectangle(cornerRadius: Constants.radius)
            .fill(Color.white.opacity(0.2))
            .frame(width: Constants.indicatorWidth, height: Constants.indicatorHeight)
            .onTapGesture {
                isOpen.toggle()
            }
    }
    init(isOpen: Binding<Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> Content){
        self.maxHeight = maxHeight
        self.minHeight = maxHeight * Constants.minHeightRatio
        self.content = content()
        self._isOpen = isOpen
    }
    var body: some View {
        GeometryReader{ geo in
            VStack(spacing: 0){
                self.indicatior.padding()
                self.content
            }.frame(width: geo.size.width , height: self.maxHeight, alignment: .top).background(
                ZStack{
                    Color.white
                    Color.black.opacity(0.8)
                })
            .cornerRadius(Constants.radius)
            .frame(height: geo.size.height, alignment: .bottom)
            .offset(y: max(self.offset + self.translation,0))
            .animation(.interactiveSpring())
            .gesture(DragGesture().updating(self.$translation, body: { (value, state, _) in
                state = value.translation.height
                
            }).onEnded({(value) in
                let snapDistance = self.maxHeight * Constants.snapRatio
                guard abs(value.translation.height) > snapDistance else{
                    return
                }
                self.isOpen = value.translation.height < 0
            }))
        }
    }
}

