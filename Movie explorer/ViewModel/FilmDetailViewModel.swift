//
//  FilmDetailViewModel.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import Foundation

class FilmDetailViewModel: ObservableObject {
    private let apiClient = APIClient()
    @Published var film: FilmDetailModel?
    
    func getDetailFilm(filmId:Int) {
        Task {
            do {
                let response = try await apiClient.request(endpoint: .detailFilm(filmId: filmId),  responseModel: FilmDetailModel.self)
                film = response
            } catch {
                print("Error fetching films: \(error)")
            }
            
        }
    }
}

