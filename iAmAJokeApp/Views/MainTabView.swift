//
//  MainTabView.swift
//  iAmAJokeApp
//
//  Created by dmoney on 4/27/24.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var viewModel: JokeViewModel
    @State private var showOnboard = true
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    Label("Jokes", systemImage: "face.smiling")
                }

            FunnyView()
                .tabItem {
                    Label("Funny", systemImage: "star.fill")
                }

        }
    }
}

