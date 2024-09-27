//
//  ErrorModel.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import Foundation

enum APIError: LocalizedError {
    case badRequest
    case decodingError
    case invalidData
    case invalidUrl
    case invalidURLResponse(url: URL)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return "Bad request"
        case .decodingError:
            return "Check your response and model types"
        case .invalidData:
            return "Failed to get data"
        case .invalidUrl:
            return "Invalid Url"
        case .invalidURLResponse(url: let url):
            return "Invalid response from URL: \(url)"
        case .unknown:
            return "Unknown error occured"
        }
    }
}
