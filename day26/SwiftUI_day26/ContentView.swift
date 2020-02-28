//
//  ContentView.swift
//  SwiftUI_day26
//
//  Created by Joshua Buhler on 2/27/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    
    var body: some View {
        VStack {
            Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                Text("\(sleepAmount, specifier: "%g") hours")
            }
            
            Form {
                DatePicker("Enter a date",
                           selection: $wakeUp,
                           in: Date()...,
                           displayedComponents: .hourAndMinute)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
