//
//  AlbumSearchAPITests.swift
//  AlbumSearchAPITests
//
//  Created by Thiago Magalhaes on 2019-05-14.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import XCTest
@testable import AlbumSearchAPI

class AlbumSearchAPITests: XCTestCase {

    var api: AlbumSearchAPI!
    
    override func setUp() {
        api = AlbumSearchAPI.shared
    }

    override func tearDown() {
        api = nil
    }

    func testRequestBlindGuardianAlbums() {
        let expectation = self.expectation(description: "Request Finished")
        var response: Outcome<SearchResult<Album>>?
        api.queryAlbums(query: "Blind Guardian") { outcome in
            response = outcome
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertNotNil(response)
        switch response! {
        case .success(let results):
            XCTAssert(true)
            XCTAssert(results.resultCount == 18)
        case .failure:
            XCTAssert(false)
        }
    }
}
