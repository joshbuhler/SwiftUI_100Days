//
//  ContentView.swift
//  Day39_Moonshot
//
//  Created by Joshua Buhler on 4/20/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

struct User: Codable {
    var name: String
    var address: Address
}

struct Address: Codable {
    var street: String
    var city: String
}

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
                
                Button("Decode JSON") {
                    let input = """
                    {
                        "name": "Taylor Swift",
                        "address": {
                            "street": "555, Taylor Swift Avenue",
                            "city": "Nashville"
                        }
                    }
                    """
                    
                    let data = Data(input.utf8)
                    let decoder = JSONDecoder()
                    if let user = try? decoder.decode(User.self, from: data) {
                        print ("Street: \(user.address.street)")
                    }
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
