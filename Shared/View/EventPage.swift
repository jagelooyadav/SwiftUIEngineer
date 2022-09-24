//
//  EventView.swift
//  SwiftUIEngineer (iOS)
//
//  Created by Diamonds on 02/07/1944 Saka.
//

import Foundation
import SwiftUI
import SwiftUIViewComponents

struct EventPage: View {
    var body: some View {
        ZStack {
            Color.background
            VStack {
                TagsView(tags: [])
                Spacer()
            }
        }
    }
}
