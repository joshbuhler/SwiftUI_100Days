//
//  ContentView.swift
//  SwiftUI_day20
//
//  Created by Joshua Buhler on 2/18/20.
//  Copyright © 2020 Buhler.me. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var countries = ["Estonia",
                     "France",
                     "Germany",
                     "Ireland",
                     "Italy",
                     "Nigeria",
                     "Poland",
                     "Russia",
                     "Spain",
                     "UK",
                     "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore:Bool = false
    @State private var scoreTitle:String = ""
    @State private var currentScore = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                           startPoint: .top,
                           endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                
                VStack{
                    Text("Tap the flag of…")
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                }.foregroundColor(Color.white)
                
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.white, lineWidth: 5))
                            .shadow(radius: 2)
                    }
                }
                
                Text("Current score: \(currentScore)").foregroundColor(Color.white)
                
                Spacer()
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text("scoreTitle"),
                  message: Text("\(scoreTitle) Your score is \(currentScore)"),
                  dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ number:Int) {
        if (number == correctAnswer) {
            scoreTitle = "Yay!"
            self.currentScore += 1
        } else {
            scoreTitle = "Boo!"
            self.currentScore -= 1
        }
        
        showingScore = true
    }
    
    func askQuestion () {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
