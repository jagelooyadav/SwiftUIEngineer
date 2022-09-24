//
//  Padding.swift
//  SwiftUIViewComponents
//
//  Created by Diamonds on 31/06/1944 Saka.
//

import SwiftUI

extension View {
    
    public func padding(_ edges: Edge.Set = .all, _ paddingOption: Padding) -> some View {
        padding(edges, paddingOption.rawValue)
    }
}

public enum Padding: CGFloat {
    case standard = 16.0
    case small = 8.0
    case extraSmall = 4.0
    case medium = 24.0
    case large = 30.0
    case extraLarge = 40.0
}
