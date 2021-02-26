//
//  NewsListVM.swift
//  News App
//
//  Created by Aaron Lee on 2020-11-20.
//

import Foundation

final class NewsListVM: ObservableObject {
    
    @Published var news = [NewsViewModel]()
    @Published var imageData = [String: Data]()
    
    func load() {
        self.getNews()
    }
    
    private func getNews() {
        let networkManager = NetworkManager()
        networkManager.getNews { (newsArticles) in
            guard let news = newsArticles else { return }
            
            let newsVM = news.map(NewsViewModel.init)
            self.getImages(for: newsVM)
            
            DispatchQueue.main.async {
                self.news = newsVM
            }
        }
    }
    
    private func getImages(for news: [NewsViewModel]) {
        let networkManager = NetworkManager()
        news.forEach { n in
            guard !n.urlToImage.isEmpty else { return }
            
            networkManager.getImage(urlString: n.urlToImage) { (data) in
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    self.imageData[n.urlToImage] = data
                }
            }
        }
    }
    
}
