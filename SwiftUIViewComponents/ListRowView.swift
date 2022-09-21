//
//  ListRowView.swift
//  SwiftUIViewComponents
//
//  Created by Diamonds on 30/06/1944 Saka.
//

import Foundation
import SwiftUI

/// Intentially avoiding this view  to bind with any model/view model so that it can be used with any domain model/view model. This is independent reusable component
public struct ListRowView: View {
    private var title: String
    private var subtitle: String?
    private var content: String?
    
    public init(title: String, subtitle: String? = nil, content: String? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
            VStack {
                ZStack {
                    Color.white.cornerRadius(Padding.small.rawValue)
                    createView()
                }.padding([.leading, .trailing, .bottom], .standard)
            }
        }
    }
    
    private func createView() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: Padding.small.rawValue) {
                HStack {
                    Text(title).font(Font.title3)
                        .foregroundColor(Color.blue.opacity(0.9)).bold()
                    Spacer()
                }.padding(.leading, .standard)
                .padding(.top, .small)
                
                if let subtitle = self.subtitle {
                    HStack {
                        Text(subtitle).font(Font.subheadline)
                            .foregroundColor(Color.gray.opacity(0.9)).bold()
                        Spacer()
                    }.padding(.leading, .standard)
                }
                
                if let subtitle = self.content {
                    HStack {
                        Text(subtitle).font(Font.title3)
                        Spacer()
                    }.padding(.leading, .standard)
                }
            }.padding(.bottom, .small)
            Spacer()
            Image(systemName: "chevron.right").padding(.trailing, .standard)
        }
    }
}

