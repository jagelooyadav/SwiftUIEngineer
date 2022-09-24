//
//  DetailPageViewModel.swift
//  SwiftUIEngineer
//
//  Created by Diamonds on 02/07/1944 Saka.
//

import Foundation
import UIKit


class DetailPageViewModel: ListRowViewModel {
    @Published var backgroundURL: URL?
    @Published var textChipTopPadding: Float = 20.0
    @Published var eventName = "Katara Summer Shopping Festival 2022" // This data is supposed to come in domain model from back end. Just jard code in UI model as it is not coming.
    
    override init(rowId: Int, rowData: ListRow) {
        super.init(rowId: rowId, rowData: rowData)
        if let urlString = rowData.image_urls?.first {
            self.backgroundURL = URL.init(string: urlString)
        }
    }
}
