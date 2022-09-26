//
//  BackgroundModifierView.swift
//  SwiftUIViewComponents
//
//  Created by Diamonds on 02/07/1944 Saka.
//

import Foundation
import SwiftUI

public struct BackgroundModifierView<Shape: InsettableShape>: ViewModifier {
    private var padingTop: CGFloat
    private var padingBottom: CGFloat
    private var padingLeading: CGFloat
    private var padingTrailing: CGFloat
    private var maxWidth: CGFloat?
    private var color: Color
    private var shape: Shape
    
    public init(padingLeading: CGFloat = Padding.small.rawValue,
                padingTrailing: CGFloat = Padding.small.rawValue,
                paddingTop: CGFloat = Padding.small.rawValue,
                paddingBottom: CGFloat = Padding.small.rawValue,
                maxWidth: CGFloat? = nil,
                shape: Shape,
                color: Color) {
        self.padingLeading = padingLeading
        self.padingTrailing = padingTrailing
        self.padingTop = paddingTop
        self.padingBottom = paddingBottom
        self.shape = shape
        self.color = color
    }
    
    public func body(content: Content) -> some View {
        content
            .padding(.top, padingTop)
            .padding(.bottom, padingBottom)
            .padding(.leading, padingLeading)
            .padding(.trailing, padingTrailing)
            .background(color)
            .clipShape(shape)
    }
}
