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
    
    init(storyId: Int) {
        self.storyDetailVM = StoryDetailViewModel(storyId: storyId)
    }
    
    var body: some View {
        VStack {
            Text(self.storyDetailVM.title)
            WebView(url: storyDetailVM.url)
        }
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyId: 8863)
    }
}
