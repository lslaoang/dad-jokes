//
//  JokeFetcher.swift
//  Dad Jokes
//
//  Created by Laurel Laoang, Jr on 6/12/24.
//

import Foundation

struct Joke: Identifiable, Codable {
    let id: Int
    let title: String
    let joke: String
}

class JokesViewModel: ObservableObject {
    @Published var jokes: [Joke] = []
    
    init() {
        if let jokesURL = Bundle.main.url(forResource: "jokes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: jokesURL)
                let decodedData = try JSONDecoder().decode([Joke].self, from: data)
                jokes = decodedData
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
    
    func getRandomJoke() -> Joke? {
        return jokes.randomElement()
    }
}


