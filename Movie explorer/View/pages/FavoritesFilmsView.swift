//
//  FavoritesFilms.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 25/09/24.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        NavigationView{
            HStack{
                if favoritesManager.favoriteFilms.isEmpty{
                    Text("no favorites movie")
                }else{
                    List(favoritesManager.favoriteFilms) { film in
                        NavigationLink(destination: FilmDetailView(filmId: film.id)){
                            HStack{
                                Text(film.title)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}
