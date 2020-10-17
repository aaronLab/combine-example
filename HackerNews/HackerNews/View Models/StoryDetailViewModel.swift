//
//  StoryDetailViewModel.swift
//  HackerNews
//
//  Created by Aaron Lee on 2020-10-17.
//

import Foundation
import Combine

class StoryDetailViewModel: ObservableObject {

    private var cancellable: AnyCancellable?

    @Published private var story: Story?

    /*
     Fetch Story
     */
    func fetchStory(storyId: Int) {
        self.cancellable = WebService().getStoryById(id: storyId)
            .catch { _ in Just(Story.placeholder() )}
            .sink(receiveCompletion: { _ in }, receiveValue: { story in
                    self.story = story
                })
    }

}

extension StoryDetailViewModel {

    var title: String {
        return self.story?.title ?? "N/A"
    }

    var url: String {
        return self.story?.url ?? ""
    }

}
