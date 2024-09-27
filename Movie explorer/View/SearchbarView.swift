//
//  SearchbarView.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import SwiftUI

struct SerchBarView:View{
    @State private var filmTitle = ""
    @StateObject private var viewModel = FilmForNameViewModel()
    @Binding var searchedFilms: [FilmModel]
    var body: some View {
               TextField("Search a film title", text: $filmTitle, onCommit: {
                   viewModel.getFilms(filmName: filmTitle)
               })
               .padding()
               .frame(height: 40)
               .background(Color.gray.opacity(0.2))
               .foregroundStyle(Color.primary)
               .cornerRadius(10)
               .padding(.horizontal)
               .padding(.vertical)
           .onReceive(viewModel.$films) { newFilms in
               searchedFilms = newFilms
           }
       }
}
