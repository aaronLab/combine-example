//
//  ContentView.swift
//  News App
//
//  Created by Aaron Lee on 2020-11-20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = NewsListVM()
    
    init() {
        viewModel.load()
    }
    
    var body: some View {
        List(viewModel.news, id: \.url) { news in
            Text(news.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
