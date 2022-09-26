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
    @Environment(\.dismiss) var dismissAction
    private var cancel: (() -> Void)
    
    init(cancel: @escaping (() -> Void)) {
        self.cancel = cancel
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                ScrollView {
                    VStack {
                        createLocationView().padding(.top, .small)
                        createEventView()
                        TitleDiscriptionView(title: eventPageViewModel.eventDetailsHeading, content: eventPageViewModel.eventDetailsDescription, badgeLabel: eventPageViewModel.eventTypeString)
                        
                        HStack {
                            TagsView(title: eventPageViewModel.tagsHeading, tags: eventPageViewModel.tagItems)
                                .sizeToFit()
                                .modifier(BackgroundModifierView.init(shape: Rectangle(), color: .white))
                        }
                        
                        TitleDiscriptionView(title: eventPageViewModel.howToReachHeading, content: eventPageViewModel.howToReachDescription)
                    }
                }.interactiveDismissDisabled(true)
                
                VStack {
                    Spacer()
                    createLayourView().padding(.bottom, 0.0)
                }
            }.navigationCustomTitle(eventPageViewModel.title)
                .backActionView {
                    cancel()
                    dismissAction()
                }
        }
    }
    
    private func createEventView() -> some View {
        VStack(spacing: 0.0) {
            HStack{
                Text(eventPageViewModel.eventTimingHeading).font(.headline)
                Spacer()
            }.padding(.top, .standard)
                .padding(.horizontal, .small)
                .padding(.bottom, .small)
            IconLabelView(iconImage: Image(systemName: .clock), title: eventPageViewModel.eventTimeString, titleProperties: LabelProperties(font: .footnote, color: .gray.opacity(0.8)))
                .padding(.bottom, .extraSmall)
                .padding(.horizontal, .small)
            IconLabelView(iconImage: Image(systemName: .folder), title: eventPageViewModel.eventDurationString, titleProperties: LabelProperties(font: .footnote, color: .gray.opacity(0.8)))
                .padding(.bottom, .standard)
                .padding(.horizontal, .small)
        }.modifier(BackgroundModifierView(shape: Rectangle(), color: .white))
    }
    
    private func createLocationView() -> some View {
        HStack {
            VStack(spacing: 0.0) {
                IconLabelView(iconImage: Image(systemName: .clock), title: eventPageViewModel.locationHeading, titleProperties: LabelProperties(font: .footnote.bold(), color: .black), isSpacingIgnored: false)
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
                Text(eventPageViewModel.locationDistanceString).font(.headline)
                Text(eventPageViewModel.distanceConstant)
                    .font(.footnote)
                    .foregroundColor(.gray.opacity(0.8))
            }.padding()
            .fixedSize(horizontal: false, vertical: true)
        }.modifier(BackgroundModifierView(shape: Rectangle(), color: .white))
    }
    
    private func createLayourView() -> some View {
        HStack() {
            Spacer()
            CircledIconButton(icon: "arrowshape.turn.up.forward",
                              color: Color(red: 108.0/255.0, green: 184.0/255.0, blue: 176.0/255.0),
                              action: nil)
            CircledIconButton(icon: .star,
                              color: Color(red: 153.0/255.0, green: 157.0/255.0,
                                           blue: 240.0/255.0),
                              action: nil)
            CircledIconButton(icon: .phoneFill, color: Color(red: 174.0/255.0, green: 118.0/255.0,
                                                             blue: 218.0/255.0),
                              action: nil)
            CapsuleButton(icon: Image(systemName: .star), text: "Direction")
            Spacer()
        }.modifier(BackgroundModifierView(padingLeading: Padding.standard.rawValue,
                                          padingTrailing: Padding.standard.rawValue,
                                          paddingTop: Padding.standard.rawValue,
                                          shape: Rectangle(), color: Color.white))
            .cornerRadius(20, corners: [.topLeft, .topRight])
            .padding([.bottom, .leading, .trailing], 0.0)
    }

}

struct Previews_EventPage_Previews: PreviewProvider {
    static var previews: some View {
        EventPage() {}
    }
}
