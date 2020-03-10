//
//  ContentView.swift
//  SwiftUI_day29
//
//  Created by Joshua Buhler on 3/10/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let avengers = ["Cap", "Widow", "Thor", "Iron Man", "Hulk", "Arrow Guy"]
    
    var body: some View {
        List (avengers, id: \.self) {
            Text($0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
