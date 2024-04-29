//
//  LaunchScreenView.swift
//  iAmAJokeApp
//
//  Created by dmoney on 4/27/24.
//

import SwiftUI

struct LaunchScreenView: View {
    @State var isAnimating = false
    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .scaleEffect(isAnimating ? 1.0 : 0.5)

            Text("Chuck Norris Jokes! 🥊👊🏽")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            Text("Greatness Now Loading...")
                .font(.headline)
        }
        .padding()
        .background(Color.white)
        .onAppear{
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)){
                isAnimating = true
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}
