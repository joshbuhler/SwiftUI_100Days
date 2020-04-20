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
        VStack {
            GeometryReader { geo in
                Image("bronco")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
                    .clipped()
            }
            
            ScrollView(.vertical) {
                VStack(spacing: 10) {
                    ForEach(0..<100) {
                        Text("Item \($0)")
                            .font(.title)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
