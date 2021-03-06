//
//  WebView.swift
//  HackerNews
//
//  Created by Aaron Lee on 2020-10-17.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView.pageNotFoundView()
        }
        
        let request = URLRequest(url: url)
        
        let wkWebView = WKWebView()
        wkWebView.load(request)
        
        return wkWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        guard let url = URL(string: self.url) else {
            return
        }
        
        let request = URLRequest(url: url)
        uiView.load(request)
        
    }
    
}
