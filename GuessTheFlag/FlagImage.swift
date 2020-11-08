//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Pavel Sakhanko on 8.11.20.
//

import SwiftUI

struct FlagImage: View {
    
    let flagNumber: Int
    let countries: [String]
    
    var body: some View {
        Image("\(countries[flagNumber])")
            .frame(height: 106)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.white, lineWidth: 1))
            .shadow(color: .white, radius: 2)
    }
}
