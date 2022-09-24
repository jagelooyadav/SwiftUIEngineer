//
//  ListRowViewModel.swift
//  SwiftUIEngineer
//
//  Created by Diamonds on 02/07/1944 Saka.
//

import Foundation
import Combine

class ListRowViewModel: ObservableObject {
    @Published var rowId: Int
    @Published var title: String
    @Published var subtitle: String?
    @Published var content: String?
    @Published var thumbURL: String?
    
    let rowData: ListRow
    
    init(rowId: Int, rowData: ListRow) {
        self.rowData = rowData
        self.rowId = rowId
        self.title = rowData.name
        self.subtitle = rowData.dateString
        self.content = "Price: " + rowData.price
        self.thumbURL = rowData.image_urls_thumbnails?.first
    }
}
