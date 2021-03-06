//
//  StoryListView.swift
//  HackerNews
//
//  Created by Aaron Lee on 2020-10-17.
//

import SwiftUI
import Combine

struct StoryListView: View {
    
    @ObservedObject private var storyListVM = StoryListViewModel()
    
    var body: some View {
        NavigationView {
            
            List(self.storyListVM.stories, id: \.id) { storyVM in
                
                NavigationLink(
                    destination: StoryDetailView(storyId: storyVM.id),
                    label: {
                        Text("\(storyVM.title)")
                    })
            }
            
            .navigationBarTitle("Hacker News")
        }
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
