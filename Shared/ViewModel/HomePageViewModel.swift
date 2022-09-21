//
//  HomePageViewModel.swift
//  SwiftUIEngineer (iOS)
//
//  Created by Diamonds on 31/06/1944 Saka.
//

import Foundation

class HomePageViewModel: ObservableObject {
    
    @Published var rows: [ListRowViewModel] = []
    
    private let service: HomePageDataProvider
    
    init(service: HomePageDataProvider = HomePageService()) {
        self.service = service
    }
    
    func fetchData() {
        self.service.fetchData { [weak self] data in
            guard let data = data, let self = self else { return }
            self.rows.removeAll()
            for (index, row) in data.results.enumerated() {
                self.rows.append(ListRowViewModel(rowId: index, title: row.name, subtitle: row.dateString, content: "Price: " + row.price))
            }
        }
    }
}

class ListRowViewModel: ObservableObject {
    @Published var rowId: Int
    @Published var title: String
    @Published var subtitle: String?
    @Published var content: String?
    
    init(rowId: Int, title: String, subtitle: String?, content: String?) {
        self.title = title
        self.subtitle = subtitle
        self.content = content
        self.rowId = rowId
    }
}
