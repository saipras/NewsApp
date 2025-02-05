//
//  NewsDetailsService.swift
//  NewsApp
//
//  Created by Sai Prasad Rekha on 05/02/25.
//

import Foundation

protocol NewsDetailsServiceProtocol  {
    func fetchLikes(articlesID: String, completion: @escaping (Int) -> Void)
    func fetchComments(articlesID: String, completion: @escaping (Int) -> Void)
    func fetchCount(from url: URL, completion: @escaping (Int) -> Void )
}


class NewsDetailService : NewsDetailsServiceProtocol {
    func fetchLikes(articlesID: String, completion: @escaping (Int) -> Void) {
        let url = URL(string: "https://cn-news-info-api.herokuapp.com/likes/\(articlesID)")!
        fetchCount(from: url, completion: completion)
    }
    
    func fetchComments(articlesID: String, completion: @escaping (Int) -> Void) {
        let url = URL(string: "https://cn-news-info-api.herokuapp.com/comments/\(articlesID)")!
        fetchCount(from: url, completion: completion)
    }
    
    func fetchCount(from url: URL, completion: @escaping (Int) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let responseString = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines), let count = Int(responseString) else {
                completion(0)
                return
            }
            completion(count)
        }.resume()
    }
}
