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
            NewsListView(newsCollection: self.newsListVM.news, imageData: self.newsListVM.imageData)
        } //: VSTACK
        .onAppear {
            newsListVM.load()
        }
    }
}
