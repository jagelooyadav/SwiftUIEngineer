//
//  View+NavigationTitle.swift
//  SwiftUIViewComponents
//
//  Created by Diamonds on 30/06/1944 Saka.
//

import SwiftUI

extension View {
    
    /// Builder function to customise navigation title at app level
    public func navigationCustomTitle(_ title: String?) -> some View {
        toolbar {
            ToolbarItem(placement: .principal) {
                if let title = title {
                    Text(title).foregroundColor(.black).font(Font.system(size: 18.0, weight: .bold, design: .rounded))
                } else {
                    EmptyView()
                }
            }
        }.navigationBarTitleDisplayMode(.inline)
    }
    
    /// Custom back button builder function can be used to add custom back action button
    public func backActionView(action: (() -> Void)?) -> some View {
        func backButtonView() -> some View {
            Button(action: {
                action?()
            }) {
                Image(systemName: .chevronLeft).padding(EdgeInsets.init(top: 10.0, leading: 0, bottom: 10.0, trailing: 20.0))
            }
        }
        return navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButtonView())
    }
}
