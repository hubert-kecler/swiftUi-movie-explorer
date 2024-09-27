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
            PopularFilmListView()
                .tabItem {
                    Label("popular", systemImage: "star")
                }
            UpcomingFilmListView()
                .tabItem {
                    Label("Upcoming", systemImage: "film")
                }
            
            TopRatedFilmListView()
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
