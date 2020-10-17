//
//  StoryDetailViewModel.swift
//  HackerNews
//
//  Created by Aaron Lee on 2020-10-17.
//

import Foundation
import Combine

class StoryDetailViewModel: ObservableObject {

    var storyId: Int
    private var cancellable: AnyCancellable?

    @Published private var story: Story?

    init(storyId: Int) {

        self.storyId = storyId
        fetchStory(id: storyId)

    }

    /*
     Fetch Story
     */
    private func fetchStory(id: Int) {
        self.cancellable = WebService().getStoryById(id: id)
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
