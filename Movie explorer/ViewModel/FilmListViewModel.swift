//
//  FilmListViewModel.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 27/09/24.
//

import Foundation

class FilmListViewModel: ObservableObject {
    private let apiClient = APIClient()
    @Published var films: [FilmModel] = []

    func getFilms(page:Int, endpoint: Endpoint) {
        Task {
            do {
                let response = try await apiClient.request(endpoint: endpoint, urlQueryItemKey: "page", urlQueryItemValue: String(page), responseModel: FilmListModel.self)
                films = response.results
            } catch {
                print("Error fetching films: \(error)")
            }
            
        }
    }
}
