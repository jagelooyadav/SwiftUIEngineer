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
            ScrollView {
                VStack {
                    createLocationView().padding(.top, .small)
                    createEventView()
                    TitleDiscriptionView(title: eventPageViewModel.eventDetailsHeading, content: eventPageViewModel.eventDetailsDescription, badgeLabel: eventPageViewModel.eventTypeString)
                    
                    HStack {
                        TagsView(title: "Tags", tags: eventPageViewModel.tagItems)
                            .sizeToFit()
                            .modifier(BackgroundModifierView.init(shape: Rectangle(), color: .white))
                    }
                    
                    TitleDiscriptionView(title: eventPageViewModel.howToReachHeading, content: eventPageViewModel.howToReachDescription)
                    Spacer()
                }
            }
        }.navigationCustomTitle("World Cup")
    }
    
    private func createEventView() -> some View {
        VStack(spacing: 0.0) {
            HStack{
                Text(eventPageViewModel.eventTimingHeading).font(.headline)
                Spacer()
            }.padding(.top, .standard)
                .padding(.horizontal, .small)
                .padding(.bottom, .small)
            IconLabelView(iconImage: Image(systemName: "clock"), title: eventPageViewModel.eventTimeString, titleProperties: LabelProperties(font: .footnote, color: .gray.opacity(0.8)))
                .padding(.bottom, .extraSmall)
                .padding(.horizontal, .small)
            IconLabelView(iconImage: Image(systemName: "folder"), title: eventPageViewModel.eventDurationString, titleProperties: LabelProperties(font: .footnote, color: .gray.opacity(0.8)))
                .padding(.bottom, .standard)
                .padding(.horizontal, .small)
        }.modifier(BackgroundModifierView(shape: Rectangle(), color: .white))
    }
    
    private func createLocationView() -> some View {
        HStack {
            VStack(spacing: 0.0) {
                IconLabelView(iconImage: Image(systemName: "clock"), title: eventPageViewModel.locationHeading, titleProperties: LabelProperties(font: .footnote.bold(), color: .black), isSpacingIgnored: false)
                    .padding(.bottom, .extraSmall)
                    .padding(.horizontal, .small)
                    .padding(.top, .small)
                IconLabelView(title: eventPageViewModel.locationDescriptionString, titleProperties: LabelProperties(font: .footnote, color: .gray.opacity(0.8)), isSpacingIgnored: false)
                    .padding(.bottom, .standard)
                    .padding(.horizontal, .large)
            }.fixedSize(horizontal: false, vertical: true)
            Spacer()
            Divider.init().frame(width: 1.0)
                .padding(.top, .extraSmall)
                .padding(.vertical, .extraSmall)
                .background(Color.gray.opacity(0.5))
            
            VStack(alignment: .center) {
                Text("2.9").font(.headline)
                Text("Km Away")
                    .font(.footnote)
                    .foregroundColor(.gray.opacity(0.8))
            }.padding()
            .fixedSize(horizontal: false, vertical: true)
        }.modifier(BackgroundModifierView(shape: Rectangle(), color: .white))
    }

}

struct Previews_EventPage_Previews: PreviewProvider {
    static var previews: some View {
        EventPage()
    }
}
