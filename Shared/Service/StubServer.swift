//
//  StubService.swift
//  SwiftUIEngineer (iOS)
//
//  Created by Diamonds on 01/07/1944 Saka.
//

import Foundation
import Combine
import Container

class StubServer: ContainerInterface {
    static let shared = StubServer()
    
    func fetch(opcode: Opcode) -> AnyPublisher<Data, Error> {
        let subject = PassthroughSubject<Data, Error>()
        DispatchQueue.global().async {
            guard let path = Bundle.main.path(forResource: "apistub", ofType: "json") else {
                return subject.send(completion: .failure(StubError.fileNotFound))
            }
            let url = URL(fileURLWithPath: path)
            guard let data = try? Data(contentsOf: url) else {
                return subject.send(completion: .failure(StubError.fileNotFound))
            }
            subject.send(data)
        }
        return subject.eraseToAnyPublisher()
    }
    
    private let dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    
    func fetchData(completion: ((HomePageData?) -> Void)?) {
        DispatchQueue.global().async {
            
        }
    }
}

enum StubError: Error, LocalizedError {
    case fileNotFound
    case parsingFailure
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "No response json found"
        case .parsingFailure:
            return "Invliad response"
        }
    }
}
