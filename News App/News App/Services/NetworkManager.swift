//
//  NetworkManager.swift
//  News App
//
//  Created by Aaron Lee on 2020-11-20.
//

import Foundation

final class NetworkManager {
    
    private let baseURLString = "http://newsapi.org/v2/"
    private let usTopHeadline = "top-headlines?country=us"
    
    func getNews(completion: @escaping ([News]?) -> Void) {
        let urlString = "\(baseURLString)\(usTopHeadline)&apiKey=\(API.key)"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let newsResponse = try? JSONDecoder().decode(NewsEnvelope.self, from: data)
            newsResponse == nil ? completion(nil) : completion(newsResponse!.articles)
        }.resume()
        
    }
    
}
