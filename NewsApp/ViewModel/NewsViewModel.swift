//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Sai Prasad Rekha on 04/02/25.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles: [NewsModel] = []
    private let newsService: NewsServiceProtocol
    
    init(newsService: NewsServiceProtocol = NewsService()) {
        self.newsService = newsService
    }
    
    func fetchNews() {
        newsService.fetchNews { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self?.articles = articles
                case .failure(let error):
                    print("Error fetching news: \(error.localizedDescription)")
                }
            }
        }
    }
}
