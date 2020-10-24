//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Pavel Sakhanko on 24.10.20.
//

import SwiftUI

struct ContentView: View {
    
    private let countries =  ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    private let correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 25) {
                VStack {
                    Text("Tap the flag...")
                        .foregroundColor(.white)
                    Text("\(countries[correctAnswer])")
                        .foregroundColor(.white)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        //
                    }, label: {
                       Image("\(countries[number])")
                        .renderingMode(.original)
                    })
                }
                
            }

            Spacer()
        }
        
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
