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
        
        self.cancellable = WebService().getAllTopStories().map { stories in
            stories.map { StoryViewModel(story: $0) }
        }.sink(receiveCompletion: { _ in }, receiveValue: { storyViewModels in
            self.stories = storyViewModels
        })
        
    }
    
}

struct StoryViewModel {
    
    let story: Story
    
    var id: Int {
        return story.id
    }
    
    var title: String {
        return self.story.title
    }
    
    var url: String {
        return self.story.url
    }
    
}
