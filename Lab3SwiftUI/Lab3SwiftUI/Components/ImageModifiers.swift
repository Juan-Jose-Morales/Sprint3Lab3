//
//  ImageModifiers.swift
//  Lab3SwiftUI
//
//  Created by Juan jose Morales on 20/5/24.
//

import Foundation
import SwiftUI

struct ImageModifier: ViewModifier {
    var width: CGFloat?
    var height: CGFloat?
    
    func body(content: Content) -> some View {
        content
        
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
            .clipShape(Circle())
            .padding()
    }
}

extension Image {
    func applyImageModifiers(width: CGFloat? = nil, height: CGFloat? = nil) -> some View {
        self.modifier(ImageModifier(width: width, height: height))
    }
}
