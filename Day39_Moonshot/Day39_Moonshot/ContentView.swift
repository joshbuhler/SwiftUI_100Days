//
//  ContentView.swift
//  Day39_Moonshot
//
//  Created by Joshua Buhler on 4/20/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geo in
                    Image("bronco")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width)
                        .clipped()
                }
                
                List(0..<100) { row in
                    NavigationLink(destination: Text("Detail View: \(row)")) {
                        Text("Row \(row)")
                    }
                }
            }
        .navigationBarTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
