//
//  MovieAPITests.swift
//  TMDBTests
//
//  Created by Seonghun Kim on 2020/01/06.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import XCTest

@testable import TMDB

class MovieAPITests: XCTestCase {
    private enum TestAPI {
        static let path = "http://api.test.org"
        static let key = "test_api_key"
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitURL() {
        let rightApi = MovieAPI(
            apiKey: TestAPI.key,
            urlPath: "api.test.org"
        )
        
        let rightRequest = rightApi.getRequest(for: .search("Test_URL", 1))
        XCTAssertNotNil(rightRequest)
        
        let wrongApi = MovieAPI(
            apiKey: TestAPI.key,
            urlPath: "api.test.org/`"
        )
        
        let wrongRequest = wrongApi.getRequest(for: .search("Test_URL", 1))
        XCTAssertNil(wrongRequest, "Created wrongRequest with wrong URL")
    }

    func testGetRequest() {
        let api = MovieAPI(
            apiKey: TestAPI.key,
            urlPath: TestAPI.path
        )
        
        let emptyTitleRequest = api.getRequest(for: .search("", 1))
        XCTAssertNil(emptyTitleRequest, "request with empty title")
        
        let request = api.getRequest(for: .search("Test_Title", 3))
        let urlString = TestAPI.path + "/search/movie?api_key=" + TestAPI.key + "&query=Test_Title&page=3&include_adult=true"
        
        XCTAssertNotNil(request, "request is nil")
        XCTAssertEqual(request?.url?.absoluteString, urlString, "request's URL is Wrong")
        XCTAssertEqual(request?.httpMethod, "GET", "request's HttpMethod is Wrong")
    }

}
