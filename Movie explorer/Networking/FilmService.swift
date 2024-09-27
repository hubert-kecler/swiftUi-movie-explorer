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
    
    func fetch<T:Decodable>(endpoint:Endpoint,
                                 urlQueryItemKey:String?=nil,
                                 urlQueryItemValue:String?=nil,
                                 responseModel:T.Type)async throws ->T{
        var urlComponents = URLComponents(string: endpoint.urlString)
        if let key=urlQueryItemKey, let value=urlQueryItemValue{
            urlComponents?.queryItems = [
                URLQueryItem(name: key, value: value),
            ]}
        guard let url = urlComponents?.url else { throw FilmError.invalidURL }
        let data = try await apiClient.request(for: url, headers: ["Authorization": apiKey])
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(T.self, from: data)
        return response
    }
    
    
    func fetchPopularFilmsList(page:Int) async throws -> [FilmModel] {
        return try await fetch(
            endpoint: .popularFilms,
            urlQueryItemKey: "page",
            urlQueryItemValue: String(page),
            responseModel: FilmListModel.self).results
    }
    
    func fetchUpcomingFilmsList(page:Int) async throws -> [FilmModel] {
        return try await fetch(
            endpoint: .upcomingFilms,
            urlQueryItemKey: "page",
            urlQueryItemValue: String(page),
            responseModel: FilmListModel.self).results
    }
    func fetchTopRatedFilmsList(page:Int) async throws -> [FilmModel] {
        return try await fetch(
            endpoint:.topRatedFilms,
            urlQueryItemKey: "page",
            urlQueryItemValue: String(page),
            responseModel: FilmListModel.self).results
    }
    
    func fetchFilmDetail(filmId:Int) async throws -> FilmDetailModel{
        return try await fetch(
            endpoint: .detailFilm(filmId: filmId),
            responseModel: FilmDetailModel.self)
    }
    
    func fetchFilmFromName(filmName: String) async throws -> [FilmModel] {
        return try await fetch(
            endpoint: .filmFromName,
            urlQueryItemKey: "query",
            urlQueryItemValue: filmName,
            responseModel: FilmListModel.self).results
    }
}
