//
//  StoryListViewModel.swift
//  HackerNews
//
//  Created by Aaron Lee on 2020-10-17.
//

import Foundation
import Combine

class StoryListViewModel: ObservableObject {
    
    @Published var stories = [StoryViewModel]()
    private var cancellable: AnyCancellable?
    
    init() {
        fetchTopStories()
    }
    
    /*
     Fetch All Stories
     */
    private func fetchTopStories() {
        
        self.cancellable = WebService().getAllTopStories().map { storyIds in
            storyIds.map { StoryViewModel(id: $0) }
        }.sink(receiveCompletion: { _ in }, receiveValue: { storyViewModels in
            self.stories = storyViewModels
        })
        
    }
    
}

struct StoryViewModel {
    
    let id: Int
    
}
