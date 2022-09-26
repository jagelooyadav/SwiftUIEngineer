//
//  CapsuleButton.swift
//  SwiftUIViewComponents
//
//  Created by Diamonds on 02/07/1944 Saka.
//

import Foundation
import SwiftUI

public struct CapsuleButton: View {
    
    private let icon: Image?
    private let text: String
    private let action: (() -> Void)?
    
    public init(icon: Image? = nil, text: String, action: (() -> Void)? = nil) {
        self.icon = icon
        self.text = text
        self.action = action
    }
    
    public var body: some View {
        ZStack {
            Button(action: { self.action?() }) {
                HStack(spacing: 5.0) {
                    if let icon = icon {
                        icon.foregroundColor(.white)
                    }
                    Text(text).foregroundColor(Color.white)
                }
            }.modifier(BackgroundModifierView(padingLeading: Padding.standard.rawValue,
                                              padingTrailing: Padding.standard.rawValue,
                                              paddingTop: Padding.small.rawValue,
                                              paddingBottom: Padding.small.rawValue,
                                              shape: Capsule(), color: Color(red: 71.0/255.0, green: 168.0/255.0, blue: 222.0/255.0)))
        }
    }
}
