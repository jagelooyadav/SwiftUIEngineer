//
//  HomePageViewModelTests.swift
//  Tests iOS
//
//  Created by Diamonds on 03/07/1944 Saka.
//

import XCTest
@testable import SwiftUIEngineer
import Combine

private class HomePageDataProviderMock: HomePageDataProvider {
    let subject = PassthroughSubject<HomePageData, Error>()
    func fetchData() -> AnyPublisher<HomePageData, Error> {
        subject.send(completion: .failure(StubError.fileNotFound))
        return subject.eraseToAnyPublisher()
    }
}

class HomePageViewModelTests: XCTestCase {
    
    private var subject1: HomePageViewModel!
    private var subject2: HomePageViewModel!
    
    private var cancelables = Set<AnyCancellable>()
    override func setUp() {
        super.setUp()
        subject1 = HomePageViewModel(service: HomePageService(container: StubServer()))
        subject2 = HomePageViewModel(service: HomePageDataProviderMock())
    }
    
    func test_selectedRow_ifDataIsNotFetchedFromService_returnNil() {
        XCTAssertNil(subject1.selectRow)
    }
    
    func test_selectedRow_ifDataIsFetched_returnSelectedRow() {
        subject1.fetchData()
        subject1.selectedRowId = 0
        subject1.$isDataLoaded
            .dropFirst()
            .dropFirst()
            .sink { [weak self] _ in
                XCTAssertEqual(self?.subject1?.selectRow?.name, "Notebook")
            }.store(in: &cancelables)
    }
    
    func test_selectedRow_ifDataProvidersFails_returnsNil() {
        subject2.fetchData()
        subject2.$isDataLoaded
            .dropFirst()
            .sink { [weak self] _ in
                XCTAssertNil(self?.subject2.selectRow)
            }.store(in: &cancelables)
    }

    override func tearDown() {
        subject1 = nil
        subject2 = nil
        super.tearDown()
    }

}
