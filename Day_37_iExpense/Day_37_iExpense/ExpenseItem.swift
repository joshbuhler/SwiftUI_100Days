//
//  ExpenseItem.swift
//  Day_37_iExpense
//
//  Created by Joshua Buhler on 4/15/20.
//  Copyright © 2020 jb. All rights reserved.
//

import Foundation


struct ExpenseItem {
    let name:String
    let type:String
    let amount:Int
}

class Expenses: ObservableObject {
    @Published var items:[ExpenseItem] = [ExpenseItem]()
}
