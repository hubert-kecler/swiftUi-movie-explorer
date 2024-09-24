//
//  FilmFromNameViewModel.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import Foundation

class FilmForNameViewModel: ObservableObject {
    private let filmService = FilmService()
    @Published var films: [FilmModel] = []
    
    func fetchFilmsFromName(filmName:String) {
        Task {
            do {
                let fetchedFilms = try await filmService.fetchFilmFromName(filmName: filmName)
                DispatchQueue.main.async {
                    self.films = fetchedFilms
                }
            } catch {
                print("Error fetching films: \(error)")
            }
            
        }
    }
}

