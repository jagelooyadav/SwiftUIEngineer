//
//  HomePageViewModel.swift
//  SwiftUIEngineer (iOS)
//
//  Created by Diamonds on 31/06/1944 Saka.
//

import Foundation

class HomePageViewModel: ObservableObject {
    
    @Published var rows: [ListRowViewModel] = []
    @Published var selectedRowId: Int = -1
    @Published var isNavigationActive: Bool = false
    static let isStubbed = true
    
    private let service: HomePageDataProvider
    
    init(service: HomePageDataProvider = HomePageViewModel.isStubbed ? StubService() : HomePageService()) {
        self.service = service
    }
    
    func fetchData() {
        self.service.fetchData { [weak self] data in
            guard let data = data, let self = self else { return }
            self.rows.removeAll()
            for (index, row) in data.results.enumerated() {
                self.rows.append(ListRowViewModel(rowId: index, title: row.name, subtitle: row.dateString, content: "Price: " + row.price, thumbURL: row.image_urls_thumbnails?.first))
            }
        }
    }
}

class ListRowViewModel: ObservableObject {
    @Published var rowId: Int
    @Published var title: String
    @Published var subtitle: String?
    @Published var content: String?
    @Published var thumbURL: String?
    
    init(rowId: Int, title: String, subtitle: String?, content: String?, thumbURL: String?) {
        self.title = title
        self.subtitle = subtitle
        self.content = content
        self.rowId = rowId
        self.thumbURL = thumbURL
    }
}
