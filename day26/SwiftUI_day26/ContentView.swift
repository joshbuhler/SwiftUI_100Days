//
//  ContentView.swift
//  SwiftUI_day26
//
//  Created by Joshua Buhler on 2/27/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = Date()
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker("Enter a time:",
                           selection: $wakeUp,
                           displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                    Text("\(sleepAmount, specifier: "%g") hours")
                }
                
                Stepper(value: $coffeeAmount, in: 1...20) {
                    if (coffeeAmount == 1) {
                        Text("1 Cup")
                    } else {
                        Text("\(coffeeAmount) Cups")
                    }
                }
            }
            .navigationBarTitle("BetterRest")
            .navigationBarItems(trailing:
                Button(action:calcBedtime) {
                    Text("Calculate")
            })
        }
    }
    
    func calcBedtime() {
        print ("calcBedtime()")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
