//
//  HomePageService.swift
//  SwiftUIViewComponents
//
//  Created by Diamonds on 30/06/1944 Saka.
//

import Foundation

protocol HomePageDataProvider {
    func fetchData(completion: ((HomePageData?) -> Void)?)
}

class HomePageService: HomePageDataProvider {
    func fetchData(completion: ((HomePageData?) -> Void)?) {
        completion?(nil)
    }
}
