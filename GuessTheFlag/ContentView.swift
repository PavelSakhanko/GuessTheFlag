//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Pavel Sakhanko on 24.10.20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries =  ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .gray]) , startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 25) {
                VStack {
                    Text("Tap the flag...")
                        .foregroundColor(.white)
                    Text("\(countries[correctAnswer])")
                        .foregroundColor(.white)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        flagTapped(number)
                    }, label: {
                       Image("\(countries[number])")
                        .renderingMode(.original)
                    })
                }
                
            }

            Spacer()
        }
        .alert(isPresented: $showingScore, content: {
            Alert(title: Text("\(scoreTitle)"),
                  message: Text("Your score is ???"),
                  dismissButton: .default(Text("Continue")) {
                      askQuestion()
                  }
        )}
    )}

    func flagTapped(_ number: Int) {
        showingScore = true
        guard number == correctAnswer else {
            scoreTitle = "Wrong"
            return
        }
        scoreTitle = "Correct"
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
