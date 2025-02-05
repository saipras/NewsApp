//
//  NewsDetailMockService.swift
//  NewsApp
//
//  Created by Sai Prasad Rekha on 05/02/25.
//

import Foundation

class NewsDetailMockService : NewsDetailsServiceProtocol {
    var likesCount = 50
    var commentsCount = 30
    
    func fetchLikes(articlesID articleID: String, completion: @escaping (Int) -> Void) {
        completion(likesCount)
    }
    
    func fetchComments(articlesID articleID: String, completion: @escaping (Int) -> Void) {
        completion(commentsCount)
    }
    
    func fetchCount(from url: URL, completion: @escaping (Int) -> Void) {
        completion(42) // Mocked count for testing
    }
}
