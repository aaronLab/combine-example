//
//  WKWebView+Extensions.swift
//  HackerNews
//
//  Created by Aaron Lee on 2020-10-17.
//

import Foundation
import WebKit

extension WKWebView {
    
    static func pageNotFoundView() -> WKWebView {
        
        let wk = WKWebView()
        wk.loadHTMLString("<html><body><h1>Page not Found or Loading!</h1></body></html>", baseURL: nil)
        return wk
        
    }
    
}
