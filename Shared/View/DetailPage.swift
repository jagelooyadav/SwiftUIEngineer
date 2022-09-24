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
    @State var isPresenented = false
    
    var body: some View {
        GeometryReader { metrics in
            ZStack(alignment: .top) {
                // Add Background
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
                    self.isPresenented = true
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
        .sheet(isPresented: $isPresenented) {
            BasicBottomSheet()
        }
    }
}

struct BasicBottomSheet: View {
    @State private var showSheet = false
 
    var body: some View {
        VStack {
            Button("Show Bottom Sheet") {
                showSheet.toggle()
            }
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $showSheet) {
                Text("This is the expandable bottom sheet.")
            }
 
            Spacer()
        }.frame(height: 200.0)
    }
}
