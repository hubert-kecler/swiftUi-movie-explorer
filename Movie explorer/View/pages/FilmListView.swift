//
//  FilmListView.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 01/10/24.
//

import SwiftUI

struct FilmListView: View {
    let endpoint: Endpoint
    let navigationTitle:String
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @StateObject private var viewModel = FilmListViewModel()
    let baseUrl = "https://image.tmdb.org/t/p/w500"
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.films) { film in
                            FilmCard(film: film, baseUrl: baseUrl)
                                .onAppear {
                                    if film == viewModel.films.last {
                                        Task {
                                            await viewModel.getNextSetOfFilms(endpoint: endpoint)
                                        }
                                    }
                                }
                        }
                        .padding(.top, 20)
                    }
                }
                .navigationTitle(navigationTitle)
                .onAppear {
                    viewModel.getFilms(endpoint: endpoint)
                }
            }
        }
    }
}

