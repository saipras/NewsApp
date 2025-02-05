//
//  NewsDetailViewModelTest.swift
//  NewsAppTests
//
//  Created by Sai Prasad Rekha on 05/02/25.
//

import XCTest
@testable import NewsApp

final class NewsDetailViewModelTest: XCTestCase {
    var viewModel: NewsDetailViewModel!
    var mockService: NewsDetailMockService!
    
    override func setUp() {
        super.setUp()
        mockService = NewsDetailMockService()
        viewModel = NewsDetailViewModel(newsService: mockService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    func testFetchArticleDetails() {
        let expectation = expectation(description: "Fetch article details")
        
        viewModel.fetchArticleDetails(articleID: "123")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertEqual(self.viewModel.likes, 50, "Likes count should be 50")
            XCTAssertEqual(self.viewModel.comments, 30, "Comments count should be 30")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
}
