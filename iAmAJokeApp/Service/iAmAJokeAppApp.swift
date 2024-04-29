//
//  iAmAJokeAppApp.swift
//  iAmAJokeApp
//
//  Created by dmoney on 4/27/24.
//

import SwiftUI

@main
struct iAmAJokeAppApp: App {
    @State private var showOnboard: Bool = !UserDefaults.standard.bool(forKey: "isComplete")
    var body: some Scene {
        WindowGroup {
            let apiManager = CNAPIManager()
            let viewModel = JokeViewModel(apiManager: apiManager)
            if showOnboard {
                OnboardingView(showOnboard: $showOnboard)
            } else {
                MainTabView()
                    .environmentObject(viewModel)
            }
        }
    }
}
