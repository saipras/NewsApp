//
//  MockData.swift
//  NewsApp
//
//  Created by Sai Prasad Rekha on 05/02/25.
//

import Foundation
struct MockData {
    static let sampleArticle = NewsModel(source:
                                          ArticleSource(id:"1", name: "Test Source"),
                                         author: "John Doe",
                                         title: "Breaking news: ",
                                         description: "Something is happening",
                                         url:"https://www.cnbc.com/2025/02/05/disney-dis-earnings-q1-2025.html",
                                         urlToImage: "disney")
    
    static let sampleData: [NewsModel] = [sampleArticle, sampleArticle, sampleArticle]
}
