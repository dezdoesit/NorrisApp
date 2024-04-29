//
//  MockAPI.swift
//  iAmAJokeApp
//
//  Created by dmoney on 4/29/24.
//

import Foundation

protocol CNAPIManagerProtocol {
    func fetchRandomJokes() async throws -> Joke
}

