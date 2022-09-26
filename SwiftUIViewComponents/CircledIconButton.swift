//
//  CircledIconButton.swift
//  SwiftUIViewComponents
//
//  Created by Diamonds on 04/07/1944 Saka.
//

import Foundation
import SwiftUI

/// Creartes cirlced icon view. Foregroud and background color can be passed as input.
/// Icon to be passed should be SF symbol. To pass custom icon, this components needs to be modified
public struct CircledIconButton: View {
    
    private let color: Color
    private let action: (() -> Void)?
    
    init(color: Color = .red, action: (() -> Void)?) {
        self.color = color
        self.action = action
    }
    
    public var body: some View {
        Image(systemName: "star")
            .foregroundColor(.white)
            .modifier(BackgroundModifierView(shape: Circle(), color: color))
    }
}

struct Previews_CircledIconButton_Previews: PreviewProvider {
    static var previews: some View {
        CircledIconButton(color: .blue, action: nil)
    }
}
