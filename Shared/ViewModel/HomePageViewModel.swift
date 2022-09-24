//
//  HomePageViewModel.swift
//  SwiftUIEngineer (iOS)
//
//  Created by Diamonds on 31/06/1944 Saka.
//

import Foundation
import Combine

class HomePageViewModel: ObservableObject {
    
    @Published var rows: [ListRowViewModel] = []
    @Published var selectedRowId: Int = -1
    @Published var isNavigationActive: Bool = false
    private var cancellable: AnyCancellable?

    private let service: HomePageDataProvider
    
    var selectRow: ListRow? {
        guard selectedRowId >= 0 && rows.count > selectedRowId else { return nil }
        return rows[selectedRowId].rowData
    }
    
    init(service: HomePageDataProvider = HomePageService()) {
        self.service = service
    }
}

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
        
        cancellable = service.fetchData()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { data in
                parse(data: data)
            })
    }
}
