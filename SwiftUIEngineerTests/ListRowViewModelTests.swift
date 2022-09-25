//
//  ListRowViewModelTests.swift
//  Tests iOS
//
//  Created by Diamonds on 03/07/1944 Saka.
//

import XCTest
@testable import SwiftUIEngineer

class ListRowViewModelTests: XCTestCase {
    private var subject: ListRowViewModel!
    override func setUp() {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss.sss"
        let dateString = "2019-02-24 04:04:17.566515"
        subject = ListRowViewModel(rowId: 0, rowData: ListRow(created_at: dateFormat.date(from: dateString) ?? Date(),
                                                              price: "20AD",
                                                              name: "Fake Name",
                                                              image_urls: nil,
                                                              image_urls_thumbnails: nil))
        super.setUp()
    }
    
    func test_content_returnDisplayableText() {
        XCTAssertEqual(subject.content, "Price: 20AD")
    }
    
    func test_subtitle_returnDisplayableText() {
        XCTAssertEqual(subject.subtitle, "25 Sep 2022")
    }

    override func tearDown() {
        subject = nil
        super.tearDown()
    }


}
