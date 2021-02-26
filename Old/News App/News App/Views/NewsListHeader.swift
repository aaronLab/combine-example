//
//  NewsListHeader.swift
//  News App
//
//  Created by Aaron Lee on 2020-11-21.
//

import SwiftUI

struct NewsListHeader: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack {
                Image(systemName: "largecircle.fill.circle")
                Text("News")
                    .bold()
                Spacer()
            } //: HSTACK
            .foregroundColor(.black)
            .font(.largeTitle)
            
            Text("Top Headlines")
                .foregroundColor(.gray)
                .font(.largeTitle)
        } //: VSTACK
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}
