//
//  ContentView.swift
//  Day36_Project7
//
//  Created by Joshua Buhler on 4/14/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

class User:ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct Vehicle:Codable {
    var make:String
    var model:String
}

struct ContentView: View {
    @ObservedObject var user = User()
    
    @State private var showingSheet = false
    @State private var vehicle:Vehicle = Vehicle(make: "Ford", model: "Ka")

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            
            TextField("Vehicle:", text: $vehicle.model)
            
            Button("Show Some Sheet") {
                self.showingSheet.toggle()
                
                let encoder = JSONEncoder()
                if let data = try? encoder.encode(self.vehicle) {
                    UserDefaults.standard.set(data, forKey: "vehicle")
                }
            }
            .sheet(isPresented: $showingSheet) {
//                SecondView(name: self.user.firstName)
                OnDeleteView()
            }
            
            Button("Load Saved Vehicle") {
                self.showingSheet.toggle()
                
                let decoder = JSONDecoder()
                if let saved = UserDefaults.standard.data(forKey: "vehicle"),
                    let v = try? decoder.decode(Vehicle.self, from: saved) {
                
                    self.vehicle = v
                }
                
            }
        }
    }
}

struct SecondView: View {
    var name:String
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Howdy, \(name)")
            Button("Dismiss") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct OnDeleteView:View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                    UserDefaults.standard.set(self.currentNumber, forKey: "Tap")
                }
            }
            .navigationBarItems(leading: EditButton())
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
