//
//  ErrorModel.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import Foundation

enum FilmError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
