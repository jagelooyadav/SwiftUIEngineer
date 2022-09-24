//
//  DetailPageViewModel.swift
//  SwiftUIEngineer
//
//  Created by Diamonds on 02/07/1944 Saka.
//

import Foundation

class DetailPageViewModel: ListRowViewModel {
    @Published var backgroundURL: URL?
    
    override init(rowId: Int, rowData: ListRow) {
        super.init(rowId: rowId, rowData: rowData)
        if let urlString = rowData.image_urls?.first {
            self.backgroundURL = URL.init(string: urlString)
        }
    }
    
}
