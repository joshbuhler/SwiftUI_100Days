//
//  ExpenseItem.swift
//  Day_37_iExpense
//
//  Created by Joshua Buhler on 4/15/20.
//  Copyright © 2020 jb. All rights reserved.
//

import Foundation


struct ExpenseItem:Identifiable, Codable {
    let id = UUID()
    let name:String
    let type:String
    let amount:Int
}

class Expenses: ObservableObject {
    @Published private(set) var items:[ExpenseItem]
    
    func addExpense(_ expense:ExpenseItem) {
        self.items.append(expense)
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(items) {
            UserDefaults.standard.set(encoded, forKey: "Items")
        }
    }
    
    func removeExpense(_ offset:IndexSet) {
        self.items.remove(atOffsets: offset)
    }
    
    init() {
            let decoder = JSONDecoder()
            if let items = UserDefaults.standard.data(forKey: "Items"),
                let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        
        self.items = []
    }
}
