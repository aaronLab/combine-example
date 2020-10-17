//
//  StoryDetailView.swift
//  HackerNews
//
//  Created by Aaron Lee on 2020-10-17.
//

import SwiftUI
import Combine

struct StoryDetailView: View {
    
    @ObservedObject private var storyDetailVM: StoryDetailViewModel
    var storyId: Int
    
    init(storyId: Int) {
        self.storyId = storyId
        self.storyDetailVM = StoryDetailViewModel()
    }
    
    var body: some View {
        VStack {
            Text(self.storyDetailVM.title)
            WebView(url: storyDetailVM.url)
        }.onAppear {
            self.storyDetailVM.fetchStory(storyId: self.storyId)
        }
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyId: 8863)
    }
}
