//
//  HomePage.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import SwiftUI
struct HomePageView: View {
    @StateObject var favoritesManager = FavoritesManager()
    var body: some View {
        VStack {
            FilmTabView()
                .environmentObject(favoritesManager)
        }
    }
}

#Preview {
    HomePageView()
}
