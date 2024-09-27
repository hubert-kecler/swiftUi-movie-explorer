//
//  UpcomingFilmListView.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 18/09/24.
//

import Foundation

class UpcomingFilmListViewModel: ObservableObject {
    private let apiClient = APIClient()
    @Published var films: [FilmModel] = []
    func getFilms(page:Int) {
        Task {
            do {
                let response = try await apiClient.request(endpoint: .upcomingFilms, urlQueryItemKey: "page", urlQueryItemValue: String(page), responseModel: FilmListModel.self)
                films = response.results
            } catch {
                print("Error fetching films: \(error)")
            }
            
        }
    }
}
