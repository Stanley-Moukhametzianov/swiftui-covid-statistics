//
//  Background.swift
//  Covid Data
//
//  Created by Stanley Moukh on 7/25/21.
//

import Foundation
import SwiftUI

struct Background: View {
    var body: some View{
        ZStack{
            //Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.5))
            LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.5)),Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                .blur(radius: 100, opaque: true)
            ZStack(alignment: .topLeading) {
                        Color.white.opacity(0.5)
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
                            .blur(radius: 1)
                        
                        
                    }
            
        }
    }
    
    
}
