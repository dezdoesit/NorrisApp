//
//  JokeDetailView.swift
//  iAmAJokeApp
//
//  Created by dmoney on 4/27/24.
//

import SwiftUI

struct JokeDetailView: View {
    let joke: Joke
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20) {
                Text(joke.value)
                    .padding()
                    .font(.title)

            }
            .padding()
        }
    }
}
