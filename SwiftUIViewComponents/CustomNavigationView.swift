//
//  CustomNavigationView.swift
//  SwiftUIViewComponents
//
//  Created by Diamonds on 30/06/1944 Saka.
//

import SwiftUI

extension View {
    public func navigationCustomTitle(_ title: String?, mode: NavigationBarItem.TitleDisplayMode = .inline, backAction: (() -> Void)? = nil) -> some View {
        toolbar {
            ToolbarItem(placement: .principal) {
                if let title = title {
                    Text(title).foregroundColor(.black).font(Font.system(size: 18.0, weight: .bold, design: .rounded)).padding(.top, mode == .inline ? 0.0 : 20.0)
                } else {
                    EmptyView()
                }
            }
        }.navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        
    }
}
