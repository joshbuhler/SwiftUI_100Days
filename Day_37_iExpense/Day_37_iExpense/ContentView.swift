//
//  ContentView.swift
//  Day_37_iExpense
//
//  Created by Joshua Buhler on 4/15/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAddExpense = false
    
    @ObservedObject var expenses = Expenses()
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
        .navigationBarTitle("iExpense")
            .navigationBarItems(trailing: Button(action: {
                self.showingAddExpense = true
            }) {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: self.expenses)
        }
    }
    
    func removeItems (at offsets:IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
