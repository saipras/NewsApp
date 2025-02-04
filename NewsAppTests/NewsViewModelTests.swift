//
//  NewsViewModelTests.swift
//  NewsAppTests
//
//  Created by Sai Prasad Rekha on 04/02/25.
//

import XCTest
@testable import NewsApp

final class NewsViewModelTests: XCTestCase {
    
    
    var viewModel: NewsViewModel!
    var mockService: MockNewsService!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        mockService = MockNewsService()
        viewModel = NewsViewModel(newsService: mockService)
    }
    
    override  func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    func testFetchNews_Success() {
        // Given
        mockService.shouldReturnError = false
        
        // When
        let expectation = XCTestExpectation(description: "Fetch news successfully")
        viewModel.fetchNews()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Then
            XCTAssertEqual(self.viewModel.articles.count, 1)
            XCTAssertEqual(self.viewModel.articles.first?.title, "Test Title")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
    }
    
    func testFetchNews_Failure() {
        // Given
        mockService.shouldReturnError = true
        
        // When
        let expectation = XCTestExpectation(description: "Fetch news failed")
        viewModel.fetchNews()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Then
            XCTAssertEqual(self.viewModel.articles.count, 0)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
    }
}
