//
//  NewsModel.swift
//  NewsApp
//
//  Created by Sai Prasad Rekha on 04/02/25.
//

import Foundation

//MARK: News Model
/// Represents a news article with associated meta data.
/// id: is a unique identifier for the article, using its url or generating a uuid if unavailable.
struct NewsModel: Identifiable, Decodable {
    var id: String { url ?? UUID().uuidString }
    var source: ArticleSource?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
}

//MARK: ArticleSource Model
///Represents the source of the news article
struct ArticleSource: Decodable {
    var id: String?
    var name: String?
}

//MARK: ArticleResponse Model 
///Represents the APi response containing a list of articles.
struct ArticlesResponse: Decodable {
    var status: String
    var totalResults: Int
    var articles: [NewsModel]
}
