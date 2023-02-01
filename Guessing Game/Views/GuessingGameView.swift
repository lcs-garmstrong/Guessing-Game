//
//  GuessingGameView.swift
//  Guessing Game
//
//  Created by Graeme Armstrong on 2023-02-01.
//

import SwiftUI

struct GuessingGameView: View {
    
    // MARK: Stored properties
    
    // The input collected from the Slider
    // ADD MISSING CODE HERE
    @State var playerGuess: Double = 1
    
    // The secret target that the user is trying to guess
    @State var target = Int.random(in: 0...100)
    
    // What feedback to provide the user with
    @State var feedback = ""
    
    // MARK: Computed properties
    
    var body: some View {
        
        VStack {
            
            // Collect the user's input using a Slider
            // ADD MISSING CODE HERE
            Slider(value: $playerGuess,
                   in: 0...100,
                   step: 1.0,
                   label: {Text("Guess")},
                   minimumValueLabel: {Text("0")},
                   maximumValueLabel: {Text("100")})
            
            Text("\(playerGuess.formatted(.number.precision(.fractionLength(1))))")
            
            // Show the user's input to them using a Text view
            // ADD MISSING CODE HERE
            
            // Let the user check to see if their current guess is correct
            Button(action: {
                
                // Convert the user's input, which is a Double, into an Int
                let currentGuessAsInteger = Int(playerGuess)

                // Compare the user's guess to the target and give appropriate feedback
                // ADD MISSING CODE HERE
                
                if currentGuessAsInteger < target {
                    feedback = "Guess higher"
                } else {
                    feedback = "Guess lower"
                }
                
                if currentGuessAsInteger == target {
                    feedback = "You got it!"
                }
                    
            }, label: {
                Text("Submit Guess")
            })
            .buttonStyle(.bordered)
            
            // Show the feedback to the user
            Text(feedback)
                .font(.title3)
                .italic()
                .multilineTextAlignment(.center)
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("Guessing Game")
        
    }
}

struct GuessingGameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GuessingGameView()
        }
    }
}
