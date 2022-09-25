//
//  HomePageServiceTests.swift
//  SwiftUIEngineerTests
//
//  Created by Diamonds on 03/07/1944 Saka.
//

import XCTest
@testable import SwiftUIEngineer
import Container
import Combine


final class HomePageServiceTests: XCTestCase {
    private var serverMock: ContainerInterface!
    private var subject: HomePageService!
    private var cancelables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        serverMock = StubServer()
        subject = HomePageService(container: serverMock)
    }
    
    func test_fetchData_withStubSuccessData_returnHomePageData() {
        let expectation = expectation(description: "Check whether completion block call or not")
        subject.fetchData()
            .sink(receiveCompletion: { _ in }) { data in
                expectation.fulfill()
                XCTAssertEqual(data.results.count, 20)
            }.store(in: &cancelables)
        waitForExpectations(timeout: 1.0)
        
    }
    
    override func tearDown() {
        subject = nil
        serverMock = nil
        
        super.tearDown()
    }
}
