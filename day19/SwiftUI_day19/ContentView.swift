//
//  ContentView.swift
//  SwiftUI_day19
//
//  Created by Joshua Buhler on 2/11/20.
//  Copyright © 2020 C4. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputValue:String = "1"
    @State var outputValue:String = "0"
    
    var reducedInput:Double {
        get {
            let inputRate = Double(conversionRates[inputSelection])
            let i = Double(inputValue) ?? 0
            let iMB = i * inputRate
            print ("iMB: \(iMB)")
            return iMB
        }
    }
    
    var output:Double {
        get {
            
            let outputRate = Double(conversionRates[outputSelection])
            let o = self.reducedInput / outputRate
            
            return o
        }
    }
    
    var conversionRates = [1024, 1000]
    var unitOptions = ["Reality GBs", "Marketing GBs"]
    @State var inputSelection = 0
    @State var outputSelection = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Value")) {
                    TextField("Unit:",
                              text: $inputValue).keyboardType(.decimalPad)
                }
                
                Section(header: Text("Convert from…")) {
                    Picker("These…", selection: $inputSelection) {
                        ForEach(0 ..< unitOptions.count) {
                            Text("\(self.unitOptions[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("To…")) {
                    Picker("These.", selection: $outputSelection) {
                        ForEach(0 ..< unitOptions.count) {
                            Text("\(self.unitOptions[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output Value")) {
                    Text("\(output) GBs")
                }
                
            }
            .navigationBarTitle("How many GBs?")
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
