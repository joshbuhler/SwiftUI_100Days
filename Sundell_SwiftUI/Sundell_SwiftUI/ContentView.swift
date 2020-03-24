//
//  ContentView.swift
//  Sundell_SwiftUI
//
//  Created by Joshua Buhler on 3/24/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            EventHeader()
            Spacer()
        }.padding()
    }
}

struct EventHeader: View {
    var body: some View {
        HStack(spacing: 15) {
            CalendarView()
            VStack(alignment: .leading) {
                Text("Event title").font(.title)
                Text("Event location")
            }
            Spacer()
        }
    }
}

struct CalendarView: View {
    
    var eventIsVerified = true
    
    var body: some View {
        Image(systemName: "calendar")
            .resizable()
            .frame(width: 50, height: 50)
            .padding()
            .background(Color.red)
            .cornerRadius(10)
            .foregroundColor(Color.white)
            .addVerifiedBadge(eventIsVerified)
    }
}

extension View {
    func addVerifiedBadge(_ isVerified:Bool) -> some View {
        ZStack(alignment: .topTrailing) {
            self
            
            if (isVerified) {
                Image(systemName: "checkmark.circle.fill")
                    .offset(x: 3, y: -3)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
