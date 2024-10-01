//
//  APIClient.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import Foundation

class APIClient {
    let session: URLSession
    let apiKey = Costants.apiKey
    
    init(session: URLSession = .shared) {
        self.session = session
    }
   
    func request<T: Codable>(
        endpoint:Endpoint,
        urlQueryItemKey:String?=nil,
        urlQueryItemValue:String?=nil,
        responseModel:T.Type
    )async throws ->T{
// creating the URL
        var urlComponents = URLComponents(string: endpoint.urlString)
        if let key=urlQueryItemKey, let value=urlQueryItemValue{
            urlComponents?.queryItems = [
                URLQueryItem(name: key, value: value),
            ]}
// testing if the URL is correct
        guard let url = urlComponents?.url else { throw APIError.invalidUrl }
// creating the request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "Authorization")
// doing the request
        let (data, response) = try await session.data(for: request)
// testing if the request is correct
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
            throw APIError.invalidURLResponse(url: url)
        }
// decoding the respone
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedData = try decoder.decode(T.self, from: data)
        
        return decodedData
        
    }
}
