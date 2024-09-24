//
//  TopRatedFilmListViewModel.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 18/09/24.
//

import Foundation

class TopRatedFilmListViewModel: ObservableObject {
    private let filmService = FilmService()
    @Published var films: [FilmModel] = []
    
    func fetchFilms(page:Int) {
        Task {
            do {
                let fetchedFilms = try await filmService.fetchTopRatedFilmsList(page:page)
                DispatchQueue.main.async {
                    self.films = fetchedFilms
                }
            } catch {
                print("Error fetching films: \(error)")
            }
            
        }
    }
}
