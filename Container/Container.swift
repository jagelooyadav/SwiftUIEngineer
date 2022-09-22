//
//  Container.swift
//  Container
//
//  Created by Diamonds on 01/07/1944 Saka.
//

import Foundation
import Combine

public protocol ContainerInterface {
    func fetch(opcode: Opcode) -> AnyPublisher<Data, ContainerError>
}

public class Container: ContainerInterface {
    
    public static let shared = Container()
    
    public func fetch(opcode: Opcode) -> AnyPublisher<Data, ContainerError> {
        guard let url = URL(string: opcode.uri) else {
            return Fail(error: ContainerError.invalidURI)
                .eraseToAnyPublisher()
        }
        let request = URLRequest(url: url)
        return URLSession.DataTaskPublisher(request: request, session: .shared)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == NetworkConfig.successCode else {
                    throw ContainerError.unexpected
                }
                return data
            }
        
            .mapError { error in
                if let error = error as? ContainerError {
                    return error
                } else {
                    return ContainerError.error(message: error.localizedDescription)
                }
            }
            .eraseToAnyPublisher()
    }
}
