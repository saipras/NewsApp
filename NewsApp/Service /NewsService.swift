//
//  NewsService.swift
//  NewsApp
//
//  Created by Sai Prasad Rekha on 04/02/25.
//

import Foundation


enum NewsServiceError: Error {
    case invalidURL
    case noDataReceived
    case decodingFailed
}

protocol NewsServiceProtocol {
    func fetchNews(completion: @escaping (Result<[NewsModel], Error>) -> Void)
}

class NewsService: NewsServiceProtocol {
    func fetchNews(completion: @escaping (Result<[NewsModel], Error>) -> Void) {
        let apiKey = API.key
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NewsServiceError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NewsServiceError.noDataReceived))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(ArticlesResponse.self, from: data)
                completion(.success(response.articles))
            } catch {
                completion(.failure(NewsServiceError.decodingFailed))
            }
        }.resume()
    }
}


