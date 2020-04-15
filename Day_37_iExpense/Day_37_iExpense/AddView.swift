//
//  AddView.swift
//  Day_37_iExpense
//
//  Created by Joshua Buhler on 4/15/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses:Expenses
    
    @State private var name:String = ""
    @State private var type:String = "Personal"
    @State private var amount:String = ""
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }.navigationBarTitle("Add new expense")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
