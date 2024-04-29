//
//  ConfigManager.swift
//  iAmAJokeApp
//
//  Created by dmoney on 4/28/24.
//

import Foundation

class ConfigManager {
    static let shared = ConfigManager()
    private(set) var apiKey: String?

    private init() {
        loadAPIKey()
    }

    private func loadAPIKey() {
        guard let filePath = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: "/Users/dmoney/Documents/GitHub/iAmAJokeApp/iAmAJokeApp/Config.plist"),
              let value = plist.object(forKey: "API_KEY") as? String,
              !value.starts(with: "_") else {
            fatalError("APIKey not set or incorrect Config")
        }
        apiKey = value
    }
}
