//
//  EventPageViewModelTests.swift
//  SwiftUIEngineerTests
//
//  Created by Diamonds on 03/07/1944 Saka.
//

import XCTest

@testable import SwiftUIEngineer
import Combine
import SwiftUI

/// Not much logic to test as all of data are hard coded. Needs to revist once logic and date would be decided
class EventPageViewModelTests: XCTestCase {
    private var subject: EventPageViewModel!
    
    override func setUp() {
        super.setUp()
        subject = EventPageViewModel()
    }
    
    func test_colorMappings() {
        XCTAssertEqual(subject.tagItems.first?.color, Color(red: 72.0/255.0, green: 168.0/255.0, blue: 226.0/255.0))
    }
    
    func test_title() {
        XCTAssertEqual(subject.title, "World cup")
    }
    
    override func tearDown() {
        subject = nil
        super.tearDown()
    }

}
