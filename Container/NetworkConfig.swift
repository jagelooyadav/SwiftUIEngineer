//
//  NetworkConfig.swift
//  SwiftUIEngineer (iOS)
//
//  Created by Diamonds on 01/07/1944 Saka.
//

import Foundation

public enum NetworkConfig {
    public static let homePageURI = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer"
    public static let successCode = 200
}

public enum Opcode {
    case homePage
    
    var uri: String {
        switch self {
        case .homePage:
            return NetworkConfig.homePageURI
        }
    }
}
