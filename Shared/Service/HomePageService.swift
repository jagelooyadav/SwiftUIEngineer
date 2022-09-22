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

class StubService: HomePageDataProvider {
    private let dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    // https://gist.github.com/stinger/7cb1a81facf7f846e3d53f60be34dd1e
    func fetchData(completion: ((HomePageData?) -> Void)?) {
        DispatchQueue.global().async {
            guard let path = Bundle.main.path(forResource: "apistub", ofType: "json") else {
                completion?(nil)
                return
            }
            let url = URL(fileURLWithPath: path)
            guard let data = try? Data(contentsOf: url) else {
                completion?(nil)
                return
            }
            let decoder = JSONDecoder()
            let formatter = DateFormatter()
            formatter.dateFormat = self.dateFormat
            decoder.dateDecodingStrategy = .formatted(formatter)
            guard let object = try? decoder.decode(HomePageData.self, from: data) else {
                completion?(nil)
                return
            }
            completion?(object)
        }
    }
}
