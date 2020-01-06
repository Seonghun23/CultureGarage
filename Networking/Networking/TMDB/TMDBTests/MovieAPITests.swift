//
//  MovieAPITests.swift
//  TMDBTests
//
//  Created by Seonghun Kim on 2020/01/06.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import XCTest
import Foundation
@testable import TMDB

class MovieAPITests: XCTestCase {
    private enum TestAPI {
        static let path = "http://api.test.org/"
        static let key = "test_api_key"
    }
    
    private let api = MovieAPI(
        apiKey: TestAPI.key,
        urlPath: TestAPI.path
    )

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetRequest() {
//        let request = api.getRequest(for: .search("Test_Title", 3))
    }

}
