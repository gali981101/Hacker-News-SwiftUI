//
//  WebView.swift
//  80486
//
//  Created by Terry Jason on 2023/10/18.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(makeRequest())
    }
    
}

extension WebView {
    
    private func makeRequest() -> URLRequest {
        if let urlString = urlString {
            if let url = URL(string: urlString) {
                return createRequest(url)
            }
        }
        
        return createRequest(URL(string: "https://youtu.be/Svug07C2bSk?si=IuN32JqGEtQD7-yP&t=201") ?? URL(string: "https://www.apple.com/tw")!)
    }
    
    private func createRequest(_ url: URL) -> URLRequest {
        return URLRequest(url: url)
    }
    
}
