//
//  NewsListView.swift
//  News App
//
//  Created by Aaron Lee on 2020-11-21.
//

import SwiftUI

struct NewsListView: View {
    // MARK: - PROPERTIES
    
    let newsCollection: [NewsViewModel]
    let imageData: [String: Data]
    
    // MARK: - BODY

    var body: some View {
        List(self.newsCollection, id: \.url) { news in
            NewsCell(news: news, image: Image(uiImage: (self.imageData[news.urlToImage] == nil ? UIImage(systemName: "doc.append")! : UIImage(data: self.imageData[news.urlToImage]!))!))
        }
    }
}
