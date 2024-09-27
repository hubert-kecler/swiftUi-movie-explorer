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
            do {
                let response = try await apiClient.request(endpoint: .filmFromName, urlQueryItemKey: "query", urlQueryItemValue: filmName, responseModel: FilmListModel.self)
                films = response.results
            } catch {
                print("Error fetching films: \(error)")
            }
            
        }
    }
}

