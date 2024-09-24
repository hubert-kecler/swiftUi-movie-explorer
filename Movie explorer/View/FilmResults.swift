//
//  FilmResults.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import SwiftUI

struct SearchResultsView: View {
    let films: [FilmModel]
    let baseUrl = "https://image.tmdb.org/t/p/w500"
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(films) { film in
                    FilmCard(film: film, baseUrl: baseUrl)
                }
            }
        }
    }
}
