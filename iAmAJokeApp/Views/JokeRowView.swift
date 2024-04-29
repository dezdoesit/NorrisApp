//
//  JokeRowView.swift
//  iAmAJokeApp
//
//  Created by dmoney on 4/27/24.
//

import SwiftUI

struct JokeRowView: View {
    @EnvironmentObject var viewModel: JokeViewModel
    let joke: Joke
    var body: some View {
        Text(joke.value)
            .padding()
            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                Button {
                    viewModel.addFavorite(joke: joke)
                } label: {
                    Label("Favorite", systemImage: "star.fill")
                }
                .tint(.yellow)
            }
    }
}

