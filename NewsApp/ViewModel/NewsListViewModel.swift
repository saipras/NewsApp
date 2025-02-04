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
    
    func fetchArticleDetails(articleID: String) {
        let likesUrl = URL(string: "https://cn-news-info-api.herokuapp.com/likes/\(articleID)")!
        let commentsUrl = URL(string: "https://cn-news-info-api.herokuapp.com/comments/\(articleID)")!
        
        fetchCount(from: likesUrl) { [weak self] count in
            DispatchQueue.main.async {
                self?.likes = count
            }
        }
        
        fetchCount(from: commentsUrl) { [weak self] count in
            DispatchQueue.main.async {
                self?.comments = count
            }
        }
    }
    
    private func fetchCount(from url: URL, completion: @escaping (Int) -> Void) {
        print("Attempting to fetch: \(url)")
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                let responseString = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
                print("Response from \(url): \(responseString)")
                if let count = Int(responseString) {
                    completion(count)
                } else {
                    print("Error: Could not parse count from response. Using default value.")
                    completion(Int.random(in: 10...100)) // Random placeholder count
                }
            } else {
                completion(Int.random(in: 10...100)) // Placeholder value
            }
        }.resume()
    }
}
