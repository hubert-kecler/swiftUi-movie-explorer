//
//  FilmFromNameViewModel.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import Foundation

class FilmForNameViewModel: ObservableObject {
    private let apiClient = APIClient()
    @Published var films: [FilmModel] = []
    
    func getFilms(filmName:String) {
        Task {
            [weak self] in
            guard let self = self else { return }
            do {
                let response = try await apiClient.request(endpoint: .filmFromName, urlQueryItemKey: "query", urlQueryItemValue: filmName, responseModel: FilmListModel.self)
                    self.films = response.results
            } catch {
                print("Error fetching films: \(error)")
            }
            
        }
    }
}

