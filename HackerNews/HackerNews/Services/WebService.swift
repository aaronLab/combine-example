//
//  WebService.swift
//  HackerNews
//
//  Created by Aaron Lee on 2020-10-17.
//

import Foundation
import Combine

class WebService {

    /*
     Get Story by ID
     */
    func getStoryById(id: Int) -> AnyPublisher<Story, Error> {

        guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(id).json?print=pretty") else {
            fatalError("WebService -> getStoryById: Invalid URL")
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: Story.self, decoder: JSONDecoder())
            .catch { _ in Empty<Story, Error>() }
            .eraseToAnyPublisher()

    }

    /*
     Get All Stories
     */
    func getAllTopStories() -> AnyPublisher<[Int], Error> {

        guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty") else {
            fatalError("WebService -> getAllTopStories: Invalid URL")
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: [Int].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

}
