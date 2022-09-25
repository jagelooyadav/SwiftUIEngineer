//
//  DetailPage.swift
//  SwiftUIEngineer (iOS)
//
//  Created by Diamonds on 31/06/1944 Saka.
//

import Foundation
import SwiftUI
import SwiftUIViewComponents

struct DetailPage: View {
    
    @ObservedObject var viewModel: DetailPageViewModel
    @Environment(\.dismiss) var dismisAction
        
    var body: some View {
        GeometryReader { metrics in
            ZStack(alignment: .top) {
                // Add Background
                Color.background.ignoresSafeArea()
                VStack {
                    AsyncImage(url: viewModel.backgroundURL)
                        .scaledToFill()
                        .frame(width: metrics.size.width, height: metrics.size.height)
                        .padding(.top, -Padding.extraLarge.rawValue)
                        .ignoresSafeArea()
                    Spacer()
                }
                // Add content
                createContentView(contentHeight: metrics.size.height)
            }.backActionView(action: { dismisAction() })
        }
    }
    
    func createContentView(contentHeight: CGFloat) -> some View {
        VStack(spacing: 0) {
            // Add category capsule
            HStack {
                CapsuleButton(text: viewModel.title, action: {
                })
                .padding(.leading, .standard)
                    .padding(.top, contentHeight * 0.30)
                Spacer()
            }
            // Add title
            HStack {
                Text(viewModel.eventName)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.leading).foregroundColor(Color.white)
                    .padding(.top, .medium)
                    .padding(.leading, .standard)
                Spacer()
            }
        }
        .interactiveDismissDisabled(true)
        .openSheet(isPresented: $viewModel.isPresenented, height: contentHeight) {
            EventPage() {
                dismisAction()
            }
        }
    }
}

extension View {
    func openSheet(isPresented: Binding<Bool>, height: CGFloat, content: @escaping () -> some View) -> some View {
        if #available(iOS 16.0, *) {
            return sheet(isPresented: isPresented) {
                content().presentationDetents([.large, .height(height * 0.50)])
            }
        } else {
            return sheet(isPresented: isPresented, content: content)
        }
    }
}
