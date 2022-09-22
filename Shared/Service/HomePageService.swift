//
//  HomePageService.swift
//  SwiftUIViewComponents
//
//  Created by Diamonds on 30/06/1944 Saka.
//

import Foundation
import Combine
import Container

protocol HomePageDataProvider {
    func fetchData(completion: ((HomePageData?) -> Void)?)
    func fetchData() -> AnyPublisher<HomePageData, Error>
}

extension HomePageDataProvider {
    func fetchData() -> AnyPublisher<HomePageData, Error> {
        return Fail(error: ContainerError.invalidURI)
                .eraseToAnyPublisher()
    }
    
    func fetchData(completion: ((HomePageData?) -> Void)?) {
        completion?(nil)
    }
}

class HomePageService: HomePageDataProvider {
    private let dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    private let container: ContainerInterface
    
    init(container: ContainerInterface = Container.shared) {
        self.container = container
    }
    
    func fetchData() -> AnyPublisher<HomePageData, Error> {
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        decoder.dateDecodingStrategy = .formatted(formatter)
        return container.fetch(opcode: .homePage).decode(type: HomePageData.self, decoder: decoder).eraseToAnyPublisher()
    }
}
