//
//  UpcomingFilm.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 18/09/24.
//

import SwiftUI

struct UpcomingFilmListView: View {
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    @StateObject private var viewModel = FilmListViewModel()
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
                .navigationTitle("Upcoming")
            }
        }
        .onAppear {
            viewModel.getFilms(page:currentPage, endpoint:.upcomingFilms)
        }
        .onChange(of: currentPage) {
            viewModel.getFilms(page: currentPage, endpoint: .upcomingFilms)
        }
    }
}
