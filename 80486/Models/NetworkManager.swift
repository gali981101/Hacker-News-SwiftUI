//
//  NetworkManager.swift
//  80486
//
//  Created by Terry Jason on 2023/10/18.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts: Array = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            netWorking(of: url)
        }
    }
    
}

extension NetworkManager {
    
    private func netWorking(of url: URL) {
        let session = URLSession(configuration: .default)
        createDataTask(url: url, session: session)
    }
    
    private func createDataTask(url: URL, session: URLSession) {
        let task = session.dataTask(with: url) { [self] data, response, error in
            errorCheck(data, response, error)
        }
        task.resume()
    }
    
    private func errorCheck(_ data: Data?, _ res: URLResponse?, _ err: Error?) {
        if err == nil { resultHandle(data) }
    }
    
    private func resultHandle(_ data: Data?) {
        let decoder = JSONDecoder()
        
        if let data = data {
            decodedData(decoder, data)
        }
    }
    
    private func decodedData(_ decoder: JSONDecoder, _ data: Data) {
        do {
            let results = try decoder.decode(Results.self, from: data)
            DispatchQueue.main.async { [self] in
                posts = results.hits
            }
        } catch {
            print(error)
        }
    }
    
}
