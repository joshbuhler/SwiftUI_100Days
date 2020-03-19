//
//  ContentView.swift
//  Project_6
//
//  Created by Joshua Buhler on 3/17/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var animationAmount:CGFloat = 1.0
    @State private var animationAmount:Double = 1.0
    @State private var enabled = false
    
    @State private var dragAmount = CGSize.zero
    
    @State private var isShowingRed = false
    
    let letters = Array("Hello SwiftUI")
    
    var body: some View {
        // Showing and hiding views with transitions
        VStack {
            Button("Tap Me") {
                // do nothing
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }

            if (isShowingRed) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
        
        // Animating Gestures
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count) { num in
//                Text(String(self.letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(self.enabled ? Color.blue : Color.red)
//                    .offset(self.dragAmount)
//                    .animation(Animation.default.delay(Double(num) / 25))
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged { self.dragAmount = $0.translation }
//                .onEnded { _ in
//                    self.dragAmount = .zero
//                    self.enabled.toggle()
//                }
//        )
        
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
        
//        print("animationAmount: \(animationAmount)")
//
//        return VStack {
//            Stepper("Scale amount", value: $animationAmount.animation(
//                Animation.easeInOut(duration: 1.0)
//                .repeatCount(3, autoreverses: true)
//            ), in: 1...10)
//
//            Spacer()
//
//            Button("Tap Me") {
//                self.animationAmount += 1.0
//            }
//            .padding(40)
//            .background(Color.red)
//            .foregroundColor(Color.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
//
//        }
        
//        Button("Tap Me") {
//            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
//                self.animationAmount += 360
//            }
//        }
//        .padding(50)
//        .background(Color.red)
//        .foregroundColor(Color.white)
//        .clipShape(Circle())
//        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z:1))
        
        // Controlling the animation stack
//        Button("Tap Me") {
//            // do nothing
//            self.enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled ? Color.green : Color.red)
//        .animation(nil)
//        .foregroundColor(.white)
//        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
