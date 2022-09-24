//
//  ListRowView.swift
//  SwiftUIViewComponents
//
//  Created by Diamonds on 30/06/1944 Saka.
//

import Foundation
import SwiftUI

/// Intentially avoiding this view  to bind with any model/view model so that it can be used with any domain model/view model. This is independent reusable component. Component library does not know any domain model
public struct ListRowView: View {
    private var title: String
    private var subtitle: String?
    private var content: String?
    private var thumbURL: String?
    
    enum ThumSize {
        static let width: CGFloat = 90.0
        static let height: CGFloat = 90.0
    }
    
    public init(title: String, subtitle: String? = nil, content: String? = nil, thumbURL: String?) {
        self.title = title
        self.subtitle = subtitle
        self.content = content
        self.thumbURL = thumbURL
    }
    
    public var body: some View {
        ZStack {
            Color.background
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
            // Add thumb
            VStack {
                AsyncImage(url: URL(string: thumbURL ?? "")) { image in
                    image.resizable(resizingMode: .tile).frame(width: ThumSize.width, height: ThumSize.height).padding([.leading, .bottom], .small).padding(.top, .standard).cornerRadius(Padding.small.rawValue)
                } placeholder: {
                    Color.background.frame(width: ThumSize.width, height: ThumSize.height).padding([.leading, .bottom], .small).padding(.top, .standard).cornerRadius(Padding.small.rawValue)
                }
                Spacer()
            }

            VStack(alignment: .leading, spacing: Padding.small.rawValue) {
                // Add title
                HStack {
                    Text(title).font(Font.title3)
                        .foregroundColor(Color.blue.opacity(0.9)).bold()
                    Spacer()
                }.padding(.leading, .standard)
                .padding(.top, .small)
                
                // Add subtitle if needed
                if let subtitle = self.subtitle {
                    HStack {
                        Text(subtitle).font(Font.subheadline)
                            .foregroundColor(Color.gray.opacity(0.9)).bold()
                        Spacer()
                    }.padding(.leading, .standard)
                }
                
                // Add content if needed
                if let subtitle = self.content {
                    HStack {
                        Text(subtitle).font(Font.title3)
                        Spacer()
                    }.padding(.leading, .standard)
                }
            }.padding(.bottom, .small)
            Spacer()
            
            // Add chevron image
            Image(systemName: "chevron.right").padding(.trailing, .standard)
        }
    }
}

