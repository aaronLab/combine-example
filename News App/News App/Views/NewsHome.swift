//
//  NewsHome.swift
//  News App
//
//  Created by Aaron Lee on 2020-11-21.
//

import SwiftUI

struct NewsHome: View {
    // MARK: - PROPERTIES
    
    @ObservedObject private var newsListVM = NewsListVM()
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            NewsListHeader()
        } //: VSTACK
        .onAppear {
            newsListVM.load()
        }
    }
}

struct NewsHome_Previews: PreviewProvider {
    static var previews: some View {
        NewsHome()
    }
}
