//
//  Favorites.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 25/09/24.
//

import SwiftUI

class FavoritesManager: ObservableObject {
    @Published var favoriteFilms: [FilmDetailModel] = []
    
    init() {
        loadFavorites()
    }
    func addToFavorites(_ film: FilmDetailModel) {
        if !isFavorite(film) {
            favoriteFilms.append(film)
            saveFavorites()
        }
    }
    
    func removeFromFavorites(_ film: FilmDetailModel) {
        favoriteFilms.removeAll { $0.id == film.id }
        saveFavorites()
    }
    
    func isFavorite(_ film: FilmDetailModel) -> Bool {
        return favoriteFilms.contains { $0.id == film.id }
    }
    
//encode= trasforma oggetti swift in dati binari
    func saveFavorites() {
        if let encoded = try? JSONEncoder().encode(favoriteFilms) {
            UserDefaults.standard.set(encoded, forKey: "favoriteFilms")
        }
    }
//decode= trasforma i dati da binari nel dato originale
    func loadFavorites() {
        if let savedData = UserDefaults.standard.data(forKey: "favoriteFilms"),
           let decoded = try? JSONDecoder().decode([FilmDetailModel].self, from: savedData) {
            favoriteFilms = decoded
        }
    }
}

