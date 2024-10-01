//
//  FilmListViewModel.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 27/09/24.
//
import SwiftUI
import Foundation

class FilmListViewModel: ObservableObject {
    private let apiClient = APIClient()
    @Published var films: [FilmModel] = []
    private var page = 1
    private var isLoading = false 

    func getFilms(endpoint: Endpoint) {
        Task {
            do {
                let response = try await apiClient.request(
                    endpoint: endpoint,
                    urlQueryItemKey: "page",
                    urlQueryItemValue: String(1),
                    responseModel: FilmListModel.self
                )
                films = response.results
            } catch {
                print("Error fetching films: \(error)")
            }
        }
    }

    func getNextSetOfFilms(endpoint: Endpoint) async {
        guard !isLoading else { return }
        isLoading = true
        page += 1
        do {
            let response = try await apiClient.request(
                endpoint: endpoint,
                urlQueryItemKey: "page",
                urlQueryItemValue: String(page),
                responseModel: FilmListModel.self
            )
            DispatchQueue.main.async {
                self.films += response.results
                self.isLoading = false
            }
        } catch {
            print("Error fetching films: \(error)")
            isLoading = false
        }
    }
}
