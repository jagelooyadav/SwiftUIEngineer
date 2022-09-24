//
//  TitleDiscriptionView.swift
//  SwiftUIViewComponents
//
//  Created by Diamonds on 03/07/1944 Saka.
//

import Foundation
import SwiftUI

public struct TitleDiscriptionView: View {
    private let title: String
    private let content: String
    private let badge: String?
    
    public init(title: String, content: String, badgeLabel: String? = nil) {
        self.title = title
        self.content = content
        self.badge = badgeLabel
    }
    
    public var body: some View {
        ZStack {
            VStack(spacing: 0.0) {
                // Add title and badge
                HStack(spacing: Padding.standard.rawValue) {
                    Text(title).font(.headline)
                        .foregroundColor(.black)
                        .padding(.top, .standard)
                        .padding([.leading, .trailing], .standard)
                    Spacer()
                    if let badge = badge {
                        Text(badge)
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding(.trailing, .standard)
                    }
                }
                
                // Content
                Text(content).font(.footnote)
                    .foregroundColor(Color.gray.opacity(0.8))
                    .padding(.top, .small)
                    .padding([.leading, .trailing], .standard)
                    .padding(.bottom, .standard)
            }.background(Color.white)
        }
    }
}
