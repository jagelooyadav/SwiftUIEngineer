//
//  IconLabelView.swift
//  SwiftUIViewComponents
//
//  Created by Diamonds on 03/07/1944 Saka.
//

import Foundation
import SwiftUI

/// View componets for icon and label sit together horizontally at 8 pixel distance and font and colour can be input
public struct IconLabelView: View {
    
    let iconImage: Image?
    let title: String
    let titleProperties: LabelProperties
    let isSpacingIgnored: Bool
    
    public init(iconImage: Image? = nil, title: String, titleProperties: LabelProperties, isSpacingIgnored: Bool = false) {
        self.iconImage = iconImage
        self.title = title
        self.titleProperties = titleProperties
        self.isSpacingIgnored = isSpacingIgnored
    }
    
    public var body: some View {
        ZStack {
            Color.white
            HStack(alignment: .top, spacing: Padding.small.rawValue) {
                if let iconImage = iconImage {
                    iconImage.font(titleProperties.font)
                }
                Text(title)
                    .font(titleProperties.font)
                    .foregroundColor(titleProperties.color)
                if !isSpacingIgnored {
                    Spacer()
                }
            }
        }
    }
}

