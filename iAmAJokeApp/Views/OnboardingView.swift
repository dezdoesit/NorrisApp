//
//  OnboardingView.swift
//  iAmAJokeApp
//
//  Created by dmoney on 4/27/24.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var showOnboard: Bool
    var body: some View {
            Text("Welcome to Chuck Norris Jokes! 🥊👊🏽")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

        Text("See a list of funny jokes and favorite the best ones!")
                .padding()

            Button("Get Started") {
                showOnboard = false
            }
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }

}


