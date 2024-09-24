//
//  TopRatedFilmList.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 18/09/24.
//

import SwiftUI

struct TopRatedFilmListView: View {
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    @StateObject private var viewModel = TopRatedFilmListViewModel()
    let baseUrl = "https://image.tmdb.org/t/p/w500"
    @State private var currentPage = 1

    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.films){ film in
                            FilmCard(film: film, baseUrl: baseUrl)
                        }
                    }
                    .padding(.top, 20)
                    PaginationView(currentPage: $currentPage)
                }
                .navigationTitle("Top Rated")
            }
            .onAppear {
                viewModel.fetchFilms(page: currentPage)
            }
            .onChange(of: currentPage) {
                viewModel.fetchFilms(page: currentPage)
            }
        }
    }
}
