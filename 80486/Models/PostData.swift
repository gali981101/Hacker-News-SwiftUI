//
//  PostData.swift
//  80486
//
//  Created by Terry Jason on 2023/10/18.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        objectID
    }
    
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
