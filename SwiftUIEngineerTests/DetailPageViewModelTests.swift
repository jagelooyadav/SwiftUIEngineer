//
//  DetailPageViewModelTests.swift
//  SwiftUIEngineerTests
//
//  Created by Diamonds on 03/07/1944 Saka.
//

import XCTest
import Combine

@testable import SwiftUIEngineer

class DetailPageViewModelTests: XCTestCase {
    private var subject: DetailPageViewModel!
    private var cancelables = Set<AnyCancellable>()
    
    override func setUp() {
        subject = DetailPageViewModel(rowId: 0, rowData: ListRow(created_at: Date(), price: "", name: "", image_urls: ["https:fake.com/sample.png"], image_urls_thumbnails: nil))
        super.setUp()
    }
    
    func test_backgroundURL_returnsURL() {
        let expectation = expectation(description: "Wait for data updated")
        subject.$backgroundURL.sink { [weak self] _ in
            XCTAssertEqual(self?.subject.backgroundURL?.absoluteString, "https:fake.com/sample.png")
            XCTAssertEqual(self?.subject.eventName, "Katara Summer Shopping Festival 2022")
            expectation.fulfill()
        }.store(in: &cancelables)
        waitForExpectations(timeout: 1.0)
    }
    
    override func tearDown() {
        subject = nil
        super.tearDown()
    }
}
