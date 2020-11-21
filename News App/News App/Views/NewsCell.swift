//
//  NewsCell.swift
//  News App
//
//  Created by Aaron Lee on 2020-11-21.
//

import SwiftUI

struct NewsCell: View {
    // MARK: - PROPERTIES
    
    let news: NewsViewModel
    let image: Image
    
    @State private var isPresented: Bool = false
    
    // MARK: - BODY

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 30, height: 200, alignment: .center)
                .clipped()
                .cornerRadius(20)
                .shadow(color: .black, radius: 5, x: 5, y: 5)
            
            if news.author != "" {
                Text(news.author)
                    .font(.subheadline)
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            
            if news.title != "" {
                Text(news.title)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
            
            if news.description != "" {
                Text(news.description)
                    .font(.caption)
                    .foregroundColor(.black)
            }
            
        } //: VSTACK
        .sheet(isPresented: $isPresented) {
            NewsArticleWebView(newsURL: self.news.url)
        }
        .onTapGesture {
            self.isPresented.toggle()
        }
    }
}
