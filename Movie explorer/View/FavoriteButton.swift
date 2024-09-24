//
//  FavoriteButton.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 19/09/24.
//

import SwiftUI

struct FavoriteButton: View{
    var body: some View{
        HStack {
            Spacer()
            NavigationLink(destination: FavoriteFilmListView()) {
                HStack {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            }
            .padding()
        }
    }
}
