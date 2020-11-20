//
//  ContentView.swift
//  News App
//
//  Created by Aaron Lee on 2020-11-20.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        print(API.key)
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
