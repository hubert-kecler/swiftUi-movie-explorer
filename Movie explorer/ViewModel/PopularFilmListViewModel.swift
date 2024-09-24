//
//  FilmListViewModel.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import Foundation

class PopularFilmListViewModel: ObservableObject {
    private let filmService = FilmService()
    @Published var films: [FilmModel] = []

    func fetchFilms(page:Int) {
        Task {
            do {
                let fetchedFilms = try await filmService.fetchPopularFilmsList(page:page)
                DispatchQueue.main.async {
                    self.films = fetchedFilms
                }
            } catch {
                print("Error fetching films: \(error)")
            }
            
        }
    }
}
