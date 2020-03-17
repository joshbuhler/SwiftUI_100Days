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
//        Button("Tap Me") {
//            //            self.animationAmount += 1.0
//        }
//        .padding(40)
//        .background(Color.red)
//        .foregroundColor(Color.white)
//        .clipShape(Circle())
//        .overlay(
//            Circle()
//                .stroke(Color.green)
//                .scaleEffect(animationAmount)
//                .opacity(Double(2 - animationAmount))
//                .animation(
//                    Animation.easeOut(duration: 5)
//                        .repeatForever(autoreverses: false)
//            )
//        )
//            .onAppear {
//                print("on appear")
//                self.animationAmount = 2
//        }
        
        
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                self.animationAmount += 1.0
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(Color.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
