//
//  FilmListViewModel.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import Foundation

class PopularFilmListViewModel: ObservableObject {
    private let apiClient = APIClient()
    @Published var films: [FilmModel] = []

    func getFilms(page:Int) {
        Task {
            do {
                let response = try await apiClient.request(endpoint: .popularFilms, urlQueryItemKey: "page", urlQueryItemValue: String(page), responseModel: FilmListModel.self)
                films = response.results
            } catch {
                print("Error fetching films: \(error)")
            }
            
        }
    }
}
