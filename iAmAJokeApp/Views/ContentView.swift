//
//  ContentView.swift
//  iAmAJokeApp
//
//  Created by dmoney on 4/27/24.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject private var viewModel: JokeViewModel
    @State private var isLoading = false

    var body: some View {
        NavigationStack {
            ZStack {
                List(viewModel.jokes, id: \.id) { joke in
                    NavigationLink(destination: Text(joke.value)) {
                        JokeRowView(joke: joke)
                    }
                }
                .navigationTitle("Chuck Norris Jokes")

                if isLoading {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .rotationEffect(.degrees(isLoading ? 0 : 180))

                }
            }
                .onAppear {
                    Task {
                        withAnimation(.spring.repeatForever(autoreverses: true)){
                            isLoading = true
                        }
                        try? await Task.sleep(nanoseconds: 2_000_000_000)
                        await viewModel.fetchJokes()
                        isLoading = false

                    }
            }
            }
        }
    }



#Preview {
    ContentView()
}
