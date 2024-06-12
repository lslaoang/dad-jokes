//
//  ContentView.swift
//  Dad Jokes
//
//  Created by Laurel Laoang, Jr on 6/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = JokesViewModel()
    @State private var currentJoke: Joke?
    @State private var backgroundColor = Color.white
    @State private var rotationAngle: Double = 0
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                if let joke = currentJoke {
                    VStack(spacing: 20) {
                        Text(joke.title)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                            .animation(.spring())
                        
                        Text(joke.joke)
                            .font(.title2)
                            .padding()
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .transition(.slide)
                            .animation(.easeInOut(duration: 0.5))
                    }
                    .padding(.horizontal, 20)
                } else {
                    ProgressView("Fetching Joke...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
                
                Button(action: {
                    currentJoke = viewModel.getRandomJoke()
                    backgroundColor = Color.random
                }) {
                    Text("Surprise Me with a Joke!")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 50)
                        .shadow(radius: 5)
                }
                .padding(.bottom, 30)
                .buttonStyle(ShakeButtonStyle())
            }
        }
        .onAppear {
            withAnimation {
                rotationAngle = 360
            }
        }
    }
}

// Custom Button Style for Shake Animation
struct ShakeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeInOut(duration: 0.1))
            .opacity(configuration.isPressed ? 0.6 : 1)
    }
}

// Extension to generate a random color
extension Color {
    static var random: Color {
        return Color(red: .random(in: 0.2...0.8),
                     green: .random(in: 0.2...0.8),
                     blue: .random(in: 0.2...0.8))
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

