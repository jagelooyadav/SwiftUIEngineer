//
//  HomePageData.swift
//  SwiftUIViewComponents
//
//  Created by Diamonds on 30/06/1944 Saka.
//

import Foundation

public struct HomePageData: Decodable {
    public let results: [ListRow]
}

public struct ListRow: Decodable, Hashable {
    public var created_at: Date
    public var price: String
    public var name: String
    public let image_urls: [String]?
    public let image_urls_thumbnails: [String]?
    
    public var dateString: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "DD MMM yyyy HH:mm"
        return dateFormatter.string(from: created_at)
    }
}


