//
//  DetailView.swift
//  80486
//
//  Created by Terry Jason on 2023/10/18.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://youtu.be/Svug07C2bSk?si=IuN32JqGEtQD7-yP&t=201")
}


