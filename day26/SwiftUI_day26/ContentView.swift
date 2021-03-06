//
//  ContentView.swift
//  SwiftUI_day26
//
//  Created by Joshua Buhler on 2/27/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    let model = SleepCalculator()
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var comps = DateComponents()
        comps.hour = 7
        comps.minute = 0
        return Calendar.current.date(from: comps) ?? Date()
    }
    
    var bedtime:String {
        var comps = DateComponents()
        comps.hour = 7
        comps.minute = 0
        
        let bd = Calendar.current.date(from: comps) ?? Date()
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        return formatter.string(from: bd)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("When do you want to wake up?")
                        .font(.headline)
                
                    DatePicker("Enter a time:",
                               selection: $wakeUp,
                               displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section {
                    Text("How much sleep would you like?")
                        .font(.headline)
                    
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                Section {
                    Text("How much coffee did you drink?")
                        .font(.headline)
                    
                    Stepper(value: $coffeeAmount, in: 1...20) {
                        if (coffeeAmount == 1) {
                            Text("1 Cup")
                        } else {
                            Text("\(coffeeAmount) Cups")
                        }
                    }
                }
                
                Section {
                    Text("You should go to bed at…")
                        .font(.headline)
                    Text(bedtime)
                }
            }
            .navigationBarTitle("BetterRest")
            .navigationBarItems(trailing:
                Button(action:calcBedtime) {
                    Text("Calculate")
            })
            .alert(isPresented: $showingAlert) {
               Alert(title: Text(alertTitle),
                     message: Text(alertMessage),
                     dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func calcBedtime() {
        let comps = Calendar.current.dateComponents([.hour, .minute],
                                                    from: wakeUp)
        let hour = (comps.hour ?? 0) * 60 * 60
        let minute = (comps.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute),
                                                  estimatedSleep: sleepAmount,
                                                  coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            alertTitle = "Your ideal bedtime is…"
            alertMessage = formatter.string(from: sleepTime)
        } catch let e {
            print ("error: \(e)")
            alertTitle = "Error"
            alertMessage = "There was a problem."
        }
        
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
