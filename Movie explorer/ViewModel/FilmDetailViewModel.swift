//
//  FilmDetailViewModel.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import Foundation

class FilmDetailViewModel: ObservableObject {
    private let filmService = FilmService()
    @Published var film: FilmDetailModel?
    
    func fetchDetailFilm(filmId:Int) {
        Task {
            do {
                let fetchedFilm = try await filmService.fetchFilmDetail(filmId: filmId)
                DispatchQueue.main.async {
                    self.film = fetchedFilm
                }
            } catch {
                print("Error fetching films: \(error)")
            }
            
        }
    }
}

