//
//  CNAPIManager.swift
//  iAmAJokeApp
//
//  Created by dmoney on 4/27/24.
//

import Foundation

struct CNAPIManager {
    private var session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }
    var baseURL: URL {
        guard let filePath = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: filePath),
              let urlString = plist.object(forKey: "API_KEY") as? String,
              let url = URL(string: urlString) else {
            fatalError("API Endpoint is not configured")
        }
        return url
    }

    func fetchRandomJokes() async throws -> Joke {
        let (data, response) = try await URLSession.shared.data(from: baseURL)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let joke = try JSONDecoder().decode(Joke.self, from: data)
        return joke

    }
}
