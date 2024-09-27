//
//  PaginationView.swift
//  Movie explorer
//
//  Created by Hubert Kecler on 20/09/24.
//

import SwiftUI

struct PaginationView: View{
    @Binding var currentPage: Int
    var body: some View{
        HStack {
            VStack{
                Button(action: {
                    currentPage = currentPage - 1
                }) {
                    Text("<- previous page")
                        .padding()
                        .foregroundColor(.primary)
                        .cornerRadius(5)
                }
            }
            Spacer()
            VStack{
                Button(action: {
                    currentPage = currentPage + 1
                }) {
                    Text("next page ->")
                        .padding()
                        .foregroundColor(.primary)
                        .cornerRadius(5)
                }
            }
        }
        .padding(.vertical)
    }
}
