//
//  ContentView.swift
//  NewsApp
//
//  Created by Sai Prasad Rekha on 04/02/25.
//

import SwiftUI


struct ContentView: View {
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.articles) { article in
                NavigationLink(destination: NewsDetailView(article: article)) {
                    NewsCard(article: article)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Latest News")
            .task {
                if viewModel.articles.isEmpty {
                    viewModel.fetchNews()
                }
            }
        }
    }
}
