//
//  JokeViewModel.swift
//  iAmAJokeApp
//
//  Created by dmoney on 4/27/24.
//

import SwiftUI

//@MainActor
class JokeViewModel: ObservableObject {
    @Published var jokes = [Joke]()
    @Published var funnies = [Joke]()
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var apiManager: CNAPIManager
    private let userDefaults = UserDefaults.standard
    private let funniesKey = "Funnies"

    init(apiManager: CNAPIManager) {
        self.apiManager = apiManager
        loadFunnies()
    }

   @MainActor func fetchJokes() async {
        isLoading = true
        errorMessage = nil
        do {
            jokes = []
            var epicJokes = Set<Joke>()
            for _ in 1...3 {
                let joke = try await apiManager.fetchRandomJokes()
                if epicJokes.insert(joke).inserted{
                    jokes.append(joke)
                }
            }
        } catch {
            errorMessage = "Failed to fetch joke: \(error.localizedDescription)"
        }
        isLoading = false
    }

    func addFavorite(joke: Joke) {
        guard !funnies.contains(where: { $0.id == joke.id }) else { return }
        funnies.append(joke)
        saveFunnies()
        }

    func removeFunnies(joke: Joke) {
        funnies.removeAll { $0.id == joke.id }
        saveFunnies()
    }

    private func saveFunnies() {
        if let encoded = try? JSONEncoder().encode(funnies) {
            userDefaults.set(encoded, forKey: funniesKey)
        }
    }

    private func loadFunnies() {
        if let savedFunnies = userDefaults.data(forKey: funniesKey),
           let decodedFunnies = try? JSONDecoder().decode([Joke].self, from: savedFunnies){
            funnies = decodedFunnies
        }
        
    }
}
