//
//  FilmTabView.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 18/09/24.
//

import SwiftUI

struct FilmTabView: View {
    @Environment(\.colorScheme) var colorScheme 
    var body: some View {
        TabView{
            FilmListView(endpoint: Endpoint.popularFilms, navigationTitle: "Popular")
                .tabItem {
                    Label("popular", systemImage: "star")
                }
            FilmListView(endpoint: Endpoint.upcomingFilms, navigationTitle: "Upcoming")
                .tabItem {
                    Label("Upcoming", systemImage: "film")
                }
            
            FilmListView(endpoint: Endpoint.topRatedFilms, navigationTitle: "Top Rated")
                .tabItem {
                    Label("Top Rated", systemImage: "checkmark.seal.fill")
                }
            SearchFilmListView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
        .accentColor(colorScheme == .dark ? .orange : .blue)    }
}
