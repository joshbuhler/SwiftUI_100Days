//
//  ContentView.swift
//  SwiftUI_day25
//
//  Created by Joshua Buhler on 2/24/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

enum Hand:Int, CaseIterable {
    case rock = 0
    case paper = 1
    case scissor = 2
    case raptor = 3
    
    var stringValue:String {
        get {
            switch self {
            case .rock:
                return "Rock"
            case .paper:
                return "Paper"
            case .scissor:
                return "Scissors"
            case .raptor:
                return "Velociraptor"
            }
        }
    }
    
    static func > (left:Hand, right:Hand) -> Bool {
        
        var rv = right.rawValue
        if (right.rawValue == allCases.last?.rawValue) {
            rv = -1
        }
        
        if (left.rawValue - rv == 1) {
            return true
        }
        
        return false
    }
    
}

enum RoundOutcome:Int, CaseIterable {
    case win = 0
    case lose = 1
    case draw = 2
    
    var stringValue:String {
        switch self {
        case .win:
            return "Win"
        case .lose:
            return "Lose"
        case .draw:
            return "Draw"
        }
    }
}

struct ContentView: View {
    
    @State var cpuMove:Int = Int.random(in: 0..<Hand.allCases.count)
    @State var targetOutcome:Int = Int.random(in: 0..<RoundOutcome.allCases.count)
    
    @State var currentRound:Int = 0
    var totalRounds:Int = 10
    
    @State var playerScore:Int = 0
    
    var blah:String {
        get {
            return RoundOutcome.allCases[targetOutcome].stringValue.uppercased()
        }
    }
    
    var cpuHand:String {
        get {
            return Hand.allCases[cpuMove].stringValue.uppercased()
        }
    }

    var body: some View {

        return VStack {
            Text("Your Score: \(playerScore)")
            
            Text("You should try to…")
            
            Spacer()
            Text("\(self.blah)")
            Spacer()
            
            Text("against")
            Text("\(self.cpuHand)")
            
            Spacer()
            
            ForEach(Hand.allCases, id:\.self) { hand in
                Button(action: {
                    self.playerSelection(playerHand: hand)
                }) {
                    Text("\(hand.stringValue)")
                }
            }
                
            Spacer()

        }
    }
    
    func newRound () {
        self.cpuMove = Int.random(in: 0..<Hand.allCases.count)
        self.targetOutcome = Int.random(in: 0..<RoundOutcome.allCases.count)
    }
    
    func playerSelection (playerHand:Hand) {
        print ("\(playerHand.stringValue)")
        
        guard let target = RoundOutcome(rawValue: targetOutcome),
        let cpuHand = Hand(rawValue: cpuMove) else {
            return
        }
        
        switch target {
        case .win:
            playerScore += (playerHand > cpuHand) ? 1 : -1
        case .lose:
            playerScore += (cpuHand > playerHand) ? 1 : -1
        case .draw:
            playerScore += (playerHand == cpuHand) ? 1 : -1
        }
        
        newRound()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
