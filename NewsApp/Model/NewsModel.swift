//
//  NewsModel.swift
//  NewsApp
//
//  Created by Sai Prasad Rekha on 04/02/25.
//

import Foundation

struct NewsModel: Identifiable, Decodable {
    var id: String { url ?? UUID().uuidString }
    var source: ArticleSource?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
}

struct ArticleSource: Decodable {
    var id: String?
    var name: String?
}

struct ArticlesResponse: Decodable {
    var status: String
    var totalResults: Int
    var articles: [NewsModel]
}
