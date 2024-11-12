//
//  ContentView.swift
//  ultima
//
//  Created by Andres Parra on 6/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var guess = ""
    @State var random = Int.random(in: 0...100)
    @State var counter = 0
    @State var message = ""
    @State var finished = false
    
    func playGame() {
        print(random)
        if let value = Int(guess){
            if value >= 0 && value <= 100 {
                counter += 1
                if value == random {
                    finished = true
                    message = "You won in \(counter) tries"
                } else if value > random {
                    message = "\(value) is too high"
                } else {
                    message = "\(value) is too low"
                }
            }
            else {
                message = "Please enter a number between 0 and 100"
            }
        }
        guess.removeAll()
    }
    
    func newGame() {
        finished = false
        counter = 0
        message = ""
        random = Int.random(in: 0...100)
        guess.removeAll()
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text("Enter a number 0-100")
                .frame(maxWidth: .infinity)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            TextField("number...", text: $guess)
                .keyboardType(.numberPad)
            Button(action: playGame) {
                Text("Play")
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            Text("Message: \(message)")
                .foregroundColor(finished ? .green : .black)
            Text("Counter: \(counter)")
            if finished {
                Button(action: newGame){
                    Text("New Game").frame(maxWidth: .infinity).foregroundColor(.green)
                }
            }
        
            
        }.padding()
    }
}









#Preview {
    ContentView()
}
