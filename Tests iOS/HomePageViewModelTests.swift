//
//  HomePageViewModelTests.swift
//  Tests iOS
//
//  Created by Diamonds on 03/07/1944 Saka.
//

import XCTest
@testable import SwiftUIEngineer

class HomePageViewModelTests: XCTestCase {
    private var subject1: HomePageViewModel!
    override func setUp() {
        super.setUp()
        subject1 = HomePageViewModel(service: HomePageService(container: StubServer()))
    }
    
    func test_selectedRow_ifDataIsNotFetched_returnNil() {
        XCTAssertNil(subject1.selectRow)
    }

    override func tearDown() {
        subject1 = nil
        super.tearDown()
    }

}
