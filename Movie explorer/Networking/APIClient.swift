//
//  APIClient.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import Foundation

class APIClient {
    let session: URLSession
    let apiKey = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYTEyMmJkMGE0Y2I0MDFhNTlmOWRmNDJlZTJlNjBhNCIsIm5iZiI6MTcyNjQ5NjUyMy43NDUzMjksInN1YiI6IjY2ZTgzY2ZhOWRmYmJkZjBlNmQwMDdlNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PDahHkDdrldCjoZnyL_rLHW8ozrlXcgoMoi9ag79djg"
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Codable>(
        endpoint:Endpoint,
        urlQueryItemKey:String?=nil,
        urlQueryItemValue:String?=nil,
        responseModel:T.Type
    )async throws ->T{
        var urlComponents = URLComponents(string: endpoint.urlString)
        if let key=urlQueryItemKey, let value=urlQueryItemValue{
            urlComponents?.queryItems = [
                URLQueryItem(name: key, value: value),
            ]}
        guard let url = urlComponents?.url else { throw APIError.invalidUrl }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
            throw APIError.invalidURLResponse(url: url)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedData = try decoder.decode(T.self, from: data)
        
        return decodedData
    }
}
