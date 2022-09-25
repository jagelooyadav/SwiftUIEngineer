//
//  HomePageViewModel.swift
//  SwiftUIEngineer (iOS)
//
//  Created by Diamonds on 31/06/1944 Saka.
//

import Foundation
import Combine

/// View model which is responsible for sending required data for rending Home Page
class HomePageViewModel: ObservableObject {
    
    @Published var rows: [ListRowViewModel] = []
    @Published var selectedRowId: Int = -1
    @Published var isNavigationActive: Bool = false
    @Published var isDataLoaded: Bool = false
    
    private var cancellable = Set<AnyCancellable>()

    private let service: HomePageDataProvider
    
    var selectRow: ListRow? {
        guard selectedRowId >= 0 && rows.count > selectedRowId else { return nil }
        return rows[selectedRowId].rowData
    }
    
    init(service: HomePageDataProvider = HomePageService()) {
        self.service = service
    }
}

// MARK: HomePageDataProvider

extension HomePageViewModel {
    func fetchData() {
        
        func parse(data: HomePageData) {
            DispatchQueue.main.async {
                self.rows.removeAll()
                for (index, row) in data.results.enumerated() {
                    self.rows.append(ListRowViewModel(rowId: index, rowData: row))
                }
            }
        }
        
        service.fetchData()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    
                    break
                case .failure(let error):
                    self.isDataLoaded = false
                    print(error.localizedDescription)
                }
            }, receiveValue: { data in
                parse(data: data)
                self.isDataLoaded = true
            }).store(in: &cancellable)
    }
}
