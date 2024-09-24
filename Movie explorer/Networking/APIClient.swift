//
//  APIClient.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import Foundation

class APIClient {
    static let shared = APIClient()
    private init() {}
    
    func request(for url: URL, method: String = "GET", headers: [String: String]? = nil) async throws -> Data {
        var request = URLRequest(url: url)
        request.httpMethod = method
        headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw FilmError.invalidResponse
        }
        return data
    }
}
