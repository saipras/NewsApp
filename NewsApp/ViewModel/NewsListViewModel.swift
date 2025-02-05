//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Sai Prasad Rekha on 04/02/25.
//
import Foundation



class NewsDetailViewModel: ObservableObject {
    @Published var likes: Int = 0
    @Published var comments: Int = 0
    
    private let newsService: NewsDetailsServiceProtocol
    
    init( newsService: NewsDetailsServiceProtocol) {
        self.newsService = newsService
    }
    
    func fetchArticleDetails(articleID: String) {
        newsService.fetchLikes(articlesID: articleID) { [weak self] count in
            DispatchQueue.main.async {
                self?.likes = count
            }
        }
        
        newsService.fetchComments(articlesID: articleID) { [weak self] count in
            DispatchQueue.main.async {
                self?.comments = count
            }
        }
    }
}
