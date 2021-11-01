//
//  Movies_ExpTests.swift
//  Movies_ExpTests
//
//  Created by Shak Feizi on 11/1/21.
//

import XCTest
@testable import Movies_Exp

class Movies_ExpTests: XCTestCase {
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testGetMoviesWithExpectedURLHostAndPath() {
        let apiRespository = APIRepository()
        let mockURLSession = MockURLSession()
        apiRespository.session = mockURLSession
        apiRespository.getMovies { movies, error in  }
        XCTAssertEqual(mockURLSession.cachedURL?.host, "mymovieslist.com")
        XCTAssertEqual(mockURLSession.cachedURL?.path, "/topmovies")
    }

}
