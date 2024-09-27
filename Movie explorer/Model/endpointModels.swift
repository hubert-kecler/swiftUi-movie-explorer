//
//  endpointModels.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 25/09/24.
//

import Foundation

enum Endpoint {
    case popularFilms
    case upcomingFilms
    case topRatedFilms
    case detailFilm(filmId:Int)
    case filmFromName
    
    
    var urlString: String {
        let baseURL = "https://api.themoviedb.org/3/movie"
        switch self {
        case .popularFilms:
            return "\(baseURL)/popular"
        case .upcomingFilms:
            return "\(baseURL)/upcoming"
        case .topRatedFilms:
            return "\(baseURL)/top_rated"
        case .detailFilm(let filmId):
            return "\(baseURL)/\(filmId)"
        case .filmFromName:
            return "https://api.themoviedb.org/3/search/movie"
        }
    }
    
}
