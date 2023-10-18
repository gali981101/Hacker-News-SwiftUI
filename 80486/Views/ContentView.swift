//
//  ContentView.swift
//  80486
//
//  Created by Terry Jason on 2023/10/18.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationStack {
            List(networkManager.posts, rowContent: { post in
                NavigationLink {
                    DetailView(url: post.url)
                } label: {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            })
            .navigationTitle("H4X0R NEWS")
        }
        .onAppear(perform: {
            networkManager.fetchData()
        })
    }
}

#Preview {
    ContentView()
}



