//
//  FilmCard.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 17/09/24.
//

import SwiftUI

struct FilmCard:View {
    let film: FilmModel
    let baseUrl: String
    var body: some View{
        NavigationLink(destination: FilmDetailView(filmId: film.id)){
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: baseUrl + (film.posterPath ?? ""))) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .cornerRadius(10)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
                Text(film.originalTitle)
                    .font(.headline)
                    .frame(alignment: .leading)
                HStack{
                    if let releaseDate = dateFromString(film.releaseDate) {
                        Text(releaseDate, format: .dateTime.day().month().year())
                            .foregroundStyle(Color.white)
                    } else {
                        Text("Data non disponibile")
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    private func dateFromString(_ dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: dateString)
    }
}
