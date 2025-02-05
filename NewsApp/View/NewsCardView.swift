//
//  NewsCardView.swift
//  NewsApp
//
//  Created by Sai Prasad Rekha on 04/02/25.
//

import SwiftUI
import Kingfisher


//MARK: News Card View
/// Display a summarized view of the news article in a horizontal stack .
struct NewsCard: View {
    let article: NewsModel
    
    var body: some View {
        HStack(alignment: .center,spacing: 20) {
            KFImage(URL(string: article.urlToImage ?? ""))
                .resizable()
                .placeholder {
                    ProgressView()
                        .frame(width: 80, height: 80)
                }
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(article.title ?? "No Title")
                    .font(.headline)
                Text(article.author ?? "Unknown Author")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }.frame(maxWidth: UIScreen.main.bounds.width - 20)
            .cornerRadius(8)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NewsCard(article: MockData.sampleArticle)
        .background(Color.green)
        
}
