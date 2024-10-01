//
//  FilmListModel.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import Foundation

struct FilmModel: Codable, Identifiable, Equatable {
    let id: Int
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}

struct FilmListModel: Codable {
    let page: Int
    let results: [FilmModel]
    let totalPages: Int
    let totalResults: Int
}
