//
//  EventPageViewModel.swift
//  SwiftUIEngineer (iOS)
//
//  Created by Diamonds on 02/07/1944 Saka.
//

import Foundation
import Combine
import SwiftUIViewComponents
import SwiftUI

class EventPageViewModel: ObservableObject {
    let data = ["Shopping", "Food", "Sports", "Fan Zones", "Movies", "Historical", "World Cup 2022 Matches"] // Supposed to come from back end
    @Published var title = "World cup"
    @Published var tagItems: [TagItem] = []
    
    @Published var eventTypeString: String = "Paid"
    
    @Published var eventDetailsHeading: String = "Event Details"
    @Published var eventDetailsDescription: String = "The cultural Village Foundation - Katra Presents, Katata Football Art Exhibition! Displaying the legacy of that FIFA World Cup, the Katara Footbal Art(KFA) exhibition was launched at Building 18 of Katara - The Cultural Village. The exhibition organized by Katara and MAPS Internation shocases the key moments of the last five editions of FIFA World cup."
    
    @Published var howToReachHeading: String = "How to Reach There"
    @Published var howToReachDescription: String = "The road leading to the fan zone is not accessible by car, the last point you can park the car in is AI Bidda park then you need to walk 900m to the fsan zone."

    
    /// Color mapping would be decided by business. iyt might be on basis of tag type/category or random decided by client code
    private let colorMappings =
    ["Shopping": Color(red: 72.0/255.0, green: 168.0/255.0, blue: 226.0/255.0),
     "Food": Color(red: 153.0/255.0, green: 157.0/255.0, blue: 240.0/255.0),
     "Sports": Color(red: 243.0/255.0, green: 186.0/255.0, blue: 64.0/255.0),
     "Fan Zones": Color(red: 108.0/255.0, green: 184.0/255.0, blue: 176.0/255.0),
     "Movies": Color.pink,
     "Historical": Color.green,
     "World Cup 2022 Matches": Color(red: 72.0/255.0, green: 168.0/255.0, blue: 226.0/255.0)]
    
    @Published var eventTimingHeading: String = "Event Timing"
    @Published var eventTimeString: String = "Each Sun, Mon, Thu 10.00 pm - 2.00 pm"
    @Published var eventDurationString: String = "22 Nov 2022 - 29 Dec 2022"
    
    @Published var locationHeading: String = "Katara Cultural Village Main Art Center"
    @Published var locationDescriptionString: String = "AI Gassar, Doha"
    @Published var locationDistanceString: String = "2.9"
    @Published var tagsHeading: String = "Tags"
    let distanceConstant = "Km Away"
    
    init() {
        initialiseTags()
    }
    
    private func initialiseTags() {
        tagItems = data.map {
            TagItem(tagId: nil, tagText: $0, color: colorMappings[$0] ?? Color.blue)
        }
    }
    
}
