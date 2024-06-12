//
//  LaunchScreen.swift
//  Dad Jokes
//
//  Created by Laurel Laoang, Jr on 6/12/24.
//

import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "smiley")
                .font(.system(size: 100))
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2, x: 0, y: 2)
                .padding()
            
            Text("Loading Jokes...")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2, x: 0, y: 2)
            
            Spacer()
        }
        .background(Color.blue.edgesIgnoringSafeArea(.all))
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}

