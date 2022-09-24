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
    @ObservedObject var eventPageViewModel = EventPageViewModel()

    var body: some View {
        ZStack {
            Color.background
            VStack {
                TitleDiscriptionView(title: eventPageViewModel.eventDetailsHeading, content: eventPageViewModel.eventDetailsDescription, badgeLabel: eventPageViewModel.eventTypeString)
                    .padding(.top, .standard)
                
                HStack {
                    TagsView(title: "Tags", tags: eventPageViewModel.tagItems)
                        .sizeToFit()
                        .padding(.horizontal, .standard)
                        
                    Spacer()
                }
                
                TitleDiscriptionView(title: eventPageViewModel.howToReachHeading, content: eventPageViewModel.howToReachDescription)
                Spacer()
            }
        }.navigationCustomTitle("World Cup")
    }
}

struct Previews_EventPage_Previews: PreviewProvider {
    static var previews: some View {
        EventPage()
    }
}
