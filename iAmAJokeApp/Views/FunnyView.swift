//
//  FunnyView.swift
//  iAmAJokeApp
//
//  Created by dmoney on 4/27/24.
//

import SwiftUI

struct FunnyView: View {
    @EnvironmentObject var viewModel: JokeViewModel

    var body: some View {
        List{
            ForEach(viewModel.funnies, id: \.id) { joke in
                Text(joke.value)
                    .padding()
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            viewModel.removeFunnies(joke: joke)
                        } label: {
                            Label("Remove", systemImage: "trash")
                        }
                    }

            }

        }
        .navigationTitle("Favorites")
    }
}

