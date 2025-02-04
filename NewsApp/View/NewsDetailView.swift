//
//  NewsDetailView.swift
//  NewsApp
//
//  Created by Sai Prasad Rekha on 04/02/25.
//

//
//  NewsDetailView.swift
//  NewsAppSwiftUI
//
//  Created by Şule Kaptan on 17.05.2024.
//

import SwiftUI
import Kingfisher

struct NewsDetailView: View {
    let article: NewsModel
    @StateObject private var detailViewModel = NewsDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                KFImage(URL(string: article.urlToImage ?? ""))
                    .resizable()
                    .placeholder {
                        ProgressView()
                            .frame(height: 200)
                    }
                    .frame(height: 200)
                    .cornerRadius(8)
                
                Text(article.title ?? "No Title")
                    .font(.title)
                    .bold()
                Text(article.description ?? "No Description Available")
                    .font(.body)
                    .padding(.vertical, 5)
                
                HStack {
                    Text("Likes: \(detailViewModel.likes)")
                    Text("Comments: \(detailViewModel.comments)")
                }
                .font(.headline)
                .padding()
            }
            .padding()
            .onAppear {
                detailViewModel.fetchArticleDetails(articleID: article.url?.replacingOccurrences(of: "https://", with: "").replacingOccurrences(of: "/", with: "-") ?? "")
            }
        }
        .navigationTitle("News Detail")
    }
}
