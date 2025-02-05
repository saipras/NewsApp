//
//  NewsMockService.swift
//  NewsApp
//
//  Created by Sai Prasad Rekha on 04/02/25.
//

import Foundation

class MockNewsService: NewsServiceProtocol {
    var shouldReturnError = false
    var mockArticles: [NewsModel] = [
        NewsModel(source: nil, author: "Test Author", title: "Test Title", description: "Test Description", url: "https://test.com", urlToImage: "https://test.com/image.jpg")
    ]
    
    func fetchNews(completion: @escaping (Result<[NewsModel], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "Test Error", code: 1, userInfo: nil)))
        } else {
            completion(.success(mockArticles))
        }
    }
}
