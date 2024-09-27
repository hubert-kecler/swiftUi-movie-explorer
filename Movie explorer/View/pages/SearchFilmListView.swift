//
//  SearchFilmListView.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 18/09/24.
//

import Foundation

import SwiftUI

struct SearchFilmListView: View {
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    @StateObject private var viewModel = FilmListViewModel()
    @State private var searchedFilms: [FilmModel] = []

    let baseUrl = "https://image.tmdb.org/t/p/w500"
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    SerchBarView(searchedFilms: $searchedFilms)
                    if !searchedFilms.isEmpty {
                        SearchResultsView(films: searchedFilms)
                    }else{
                        Text("no film found for this title")
                    }
                    Spacer()
                }
                .navigationTitle("Search")
            }
        }
    }
}

#Preview {
    SearchFilmListView()
}

