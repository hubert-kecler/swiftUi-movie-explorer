//
//  StarRatingView.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 18/09/24.
//

import SwiftUI

struct StarRatingView: View {
    var rating: Double
        var body: some View {
            HStack(spacing: 4) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.title)
                
                Text(String(format: "%.1f", rating))
                    .font(.largeTitle)
                
                Text("/10")
                    .font(.headline) 
            }
    }
}
