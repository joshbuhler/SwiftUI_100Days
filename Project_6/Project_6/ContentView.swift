//
//  ContentView.swift
//  Project_6
//
//  Created by Joshua Buhler on 3/17/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount:CGFloat = 1.0
    
    var body: some View {
        Button("Tap Me") {
            self.animationAmount += 1.0
        }.padding(50)
            .background(Color.red)
            .foregroundColor(Color.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1) * 3)
            .animation(
                Animation.easeInOut(duration: 1).repeatCount(3, autoreverses: true)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
