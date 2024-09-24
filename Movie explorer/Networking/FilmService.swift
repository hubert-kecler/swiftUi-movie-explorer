//
//  filmService.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import Foundation

class FilmService {
    private let apiClient = APIClient.shared
    let apiKey = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYTEyMmJkMGE0Y2I0MDFhNTlmOWRmNDJlZTJlNjBhNCIsIm5iZiI6MTcyNjQ5NjUyMy43NDUzMjksInN1YiI6IjY2ZTgzY2ZhOWRmYmJkZjBlNmQwMDdlNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PDahHkDdrldCjoZnyL_rLHW8ozrlXcgoMoi9ag79djg"

    func fetchPopularFilmsList(page:Int) async throws -> [FilmModel] {
        let endpoint = "https://api.themoviedb.org/3/movie/popular"
        var urlComponents = URLComponents(string: endpoint)
        urlComponents?.queryItems = [
            URLQueryItem(name: "page", value: String(page)),
        ]
        guard let url = urlComponents?.url else { throw FilmError.invalidURL }
        let data = try await apiClient.request(for: url, headers: ["Authorization": apiKey])
        if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON: \(jsonString)")
            } else {
                print("Failed to convert data to JSON string")
            }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(FilmListModel.self, from: data)
        return response.results
    }
    
    func fetchUpcomingFilmsList(page:Int) async throws -> [FilmModel] {
        let endpoint = "https://api.themoviedb.org/3/movie/upcoming"
        var urlComponents = URLComponents(string: endpoint)
        urlComponents?.queryItems = [
            URLQueryItem(name: "page", value: String(page)),
        ]
        guard let url = urlComponents?.url else { throw FilmError.invalidURL }
        let data = try await apiClient.request(for: url, headers: ["Authorization": apiKey])
        if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON: \(jsonString)")
            } else {
                print("Failed to convert data to JSON string")
            }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(FilmListModel.self, from: data)
        return response.results
    }
    func fetchTopRatedFilmsList(page:Int) async throws -> [FilmModel] {
        let endpoint = "https://api.themoviedb.org/3/movie/top_rated"
        var urlComponents = URLComponents(string: endpoint)
        urlComponents?.queryItems = [
            URLQueryItem(name: "page", value: String(page)),
        ]
        guard let url = urlComponents?.url else { throw FilmError.invalidURL }
        let data = try await apiClient.request(for: url, headers: ["Authorization": apiKey])
        if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON: \(jsonString)")
            } else {
                print("Failed to convert data to JSON string")
            }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(FilmListModel.self, from: data)
        return response.results
    }
    
    
    func fetchFilmDetail(filmId:Int) async throws -> FilmDetailModel{
        let endpoint = "https://api.themoviedb.org/3/movie/\(filmId)"
        guard let url = URL(string: endpoint) else { throw FilmError.invalidURL }
        let data = try await apiClient.request(for: url, headers: ["Authorization": apiKey])
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(FilmDetailModel.self, from: data)
        return response
    }
    
    func fetchFilmFromName(filmName: String) async throws -> [FilmModel] {
        let endpoint = "https://api.themoviedb.org/3/search/movie"
        var urlComponents = URLComponents(string: endpoint)
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "query", value: filmName),
        ]
        guard let url = urlComponents?.url else { throw FilmError.invalidURL }
        let data = try await apiClient.request(for: url, headers: ["Authorization": apiKey])
        if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON: \(jsonString)")
            } else {
                print("Failed to convert data to JSON string")
            }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(FilmListModel.self, from: data)
        
        return response.results
    }
}

struct FilmResponse: Codable {
    let results: [FilmModel]
}

