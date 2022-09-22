//
//  AppError.swift
//  SwiftUIEngineer (iOS)
//
//  Created by Diamonds on 01/07/1944 Saka.
//

import Foundation

/// Custom error handling
public enum ContainerError: Error, LocalizedError {
    case invalidURI
    case unexpected
    case error(message: String)
    
    public var errorDescription: String? {
        switch self {
        case .invalidURI:
            return "URL is invalid"
        case .unexpected:
            return "Something went wrong!"
        case .error(let message):
            return message
        }
    }
}
