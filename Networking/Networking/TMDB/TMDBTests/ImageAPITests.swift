//
//  ImageAPI.swift
//  TMDBTests
//
//  Created by Seonghun Kim on 2020/01/06.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import XCTest

@testable import TMDB

class ImageAPITests: XCTestCase {
    private enum TestAPI {
        static let path = "http://image.test.org/"
    }
    
    let api = ImageAPI(urlPath: TestAPI.path)

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetRequest() {
        let imagePath = "/test_path.jpg"
        
        let originalRequest = api.getRequest(for: .original(imagePath))
        let originalUrlString = "http://image.test.org/t/p/original/test_path.jpg"
        
        XCTAssertNil(originalRequest, "originalRequest is nil")
        XCTAssertEqual(originalRequest?.url?.absoluteString, originalUrlString, "originalRequest's URL is Wrong")
        XCTAssertEqual(originalRequest?.httpMethod, "GET", "originalRequest's HttpMethod is Wrong")
        
        let smallRequest = api.getRequest(for: .small(imagePath))
        let smallUrlString = "http://image.test.org/t/p/w500/test_path.jpg"
        
        XCTAssertNil(smallRequest, "smallRequest is nil")
        XCTAssertEqual(smallRequest?.url?.absoluteString, smallUrlString, "smallRequest's URL is Wrong")
        XCTAssertEqual(smallRequest?.httpMethod, "GET", "smallRequest's HttpMethod is Wrong")
    }
}
