//
//  FilmDetailView.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import SwiftUI

struct FilmDetailView:View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    let filmId:Int
    let baseUrl = "https://image.tmdb.org/t/p/w500"
    var maxRataing=10.0
    @StateObject private var viewModel = FilmDetailViewModel()
    var body:some View {
        ScrollView{
            ZStack{
                if let posterPath = viewModel.film?.backdropPath{
                    AsyncImage(url: URL(string:baseUrl + posterPath)){ image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:.infinity)
                            .blur(radius: 3)
                    } placeholder: {
                        ProgressView()
                    }
                }
                if let posterPath = viewModel.film?.posterPath{
                    AsyncImage(url: URL(string:baseUrl + posterPath)){ image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120)
                    } placeholder: {
                        ProgressView()
                    }
                }
                HStack{
                    Spacer()
                    VStack{
                        Spacer()
                        Button(action: {
                            if let film = viewModel.film {
                                if favoritesManager.isFavorite(film) {
                                    favoritesManager.removeFromFavorites(film)
                                } else {
                                    favoritesManager.addToFavorites(film)
                                }
                            }
                        }) {
                            Image(systemName: viewModel.film != nil && favoritesManager.isFavorite(viewModel.film!) ? "heart.fill" : "heart")
                                .foregroundColor(viewModel.film != nil && favoritesManager.isFavorite(viewModel.film!) ? .red : .gray)
                                .font(.title)
                        }
                    }
                }
                .padding()
                
            }
            HStack{
                StarRatingView(rating: viewModel.film?.voteAverage ?? 0)
                    .frame(width: 150)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        if let genres = viewModel.film?.genres {
                            ForEach(genres) { genre in
                                Text(genre.name)
                                    .padding(5)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            }
            .padding(.top, 16)
            Text(viewModel.film?.overview ?? "overview not foud")
                .padding()
                .navigationTitle(viewModel.film?.title ?? "film title")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    viewModel.getDetailFilm(filmId:filmId)
                }
            VStack {
                HStack {
                    Text("Original title: ")
                    Text(viewModel.film?.originalTitle ?? "title not found")
                        .font(.headline)
                }
                .padding(8)
                
                Divider()
                
                HStack {
                    Text("Release date: ")
                    if let releaseDateString = viewModel.film?.releaseDate,
                       let releaseDate = dateFromString(releaseDateString) {
                        Text(releaseDate, format: .dateTime.day().month().year())
                    } else {
                        Text("Data non disponibile")
                    }
                }
                .padding(8)
                
                Divider()
                
                HStack {
                    Text("Budget: ")
                    Text("\(viewModel.film?.budget ?? 0) $")
                }
                .padding(8)
                
                Divider()
                
                HStack{
                    Text("Runtime: ")
                    Text("\(viewModel.film?.runtime ?? 0) min")
                }
                .padding(8)
            }
            .background(Color.gray.opacity(0.2))
            .frame(maxWidth: .infinity)
            .cornerRadius(10)
            .padding()
            
        }
    }
    private func dateFromString(_ dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: dateString)
    }
}
