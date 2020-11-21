//
//  NewsArticleWebView.swift
//  News App
//
//  Created by Aaron Lee on 2020-11-21.
//

import SwiftUI

struct NewsArticleWebView: View {
    // MARK: - PROPERTIES
    
    var newsURL: String
    
    // MARK: - BODY

    var body: some View {
        SwiftUIWebView(urlString: newsURL)
            .padding(.top, 20)
    }
}
