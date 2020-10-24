//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Pavel Sakhanko on 24.10.20.
//

import SwiftUI
enum ScoreTitle: String {
    case correct = "Correct"
    case wrong = "Wrong"
}

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries =  ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var incorrectAnswer = ""
    @State private var userScore = "0"
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .gray]) , startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 25) {

                Label("User Score is \(userScore)", systemImage: "")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                VStack {
                    Text("Tap the flag...")
                        .foregroundColor(.white)
                    Text("\(countries[correctAnswer])")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        flagTapped(number)
                    }, label: {
                        Image("\(countries[number])")
                            .frame(height: 106)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.white, lineWidth: 1))
                            .shadow(color: .white, radius: 2)
                    })
                }
                
            }

            Spacer()
        }
        .alert(isPresented: $showingScore, content: {
            Alert(title: Text(scoreTitle == ScoreTitle.wrong.rawValue ?
                                "Wrong! That’s the flag of \(incorrectAnswer)" : "\(scoreTitle)"),
              message: Text("Your score is \(userScore)"),
              dismissButton: .default(Text("Continue")) {
                  askQuestion()
              })
        }
    )}

    func flagTapped(_ number: Int) {
        showingScore = true

        guard number == correctAnswer else {
            incorrectAnswer = countries[number]
            scoreTitle = ScoreTitle.wrong.rawValue
            countScore(userScore: userScore, scoreTitle: scoreTitle)
            return
        }
        scoreTitle = ScoreTitle.correct.rawValue
        countScore(userScore: userScore, scoreTitle: scoreTitle)
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func countScore(userScore: String, scoreTitle: String) {
        guard var userScore = Int(userScore) else { return }
        
        switch scoreTitle {
        case ScoreTitle.correct.rawValue:
            userScore += 1
        case ScoreTitle.wrong.rawValue:
            if userScore > 0 {
                userScore -= 1
            } 
        default:
            break
        }
        self.userScore = "\(userScore)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
