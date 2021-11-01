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
        let mockURLSession = MockURLSession(data: nil, urlResponse: nil, error: nil)
        apiRespository.session = mockURLSession
        apiRespository.getMovies { movies, error in  }
        XCTAssertEqual(mockURLSession.cachedURL?.host, "mymovieslist.com")
        XCTAssertEqual(mockURLSession.cachedURL?.path, "/topmovies")
    }
    
    func testGetMoviesSuccessReturnsMovies() {
        let jsonData = "[{\"title\": \"Mission Impossible Fallout\",\"detail\": \"A Tom Cruise Movie\"}]".data(using: .utf8)
      let apiRespository = APIRepository()
        let mockURLSession  = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
      apiRespository.session = mockURLSession
      let moviesExpectation = expectation(description: "movies")
      var moviesResponse: [Movie]?
      apiRespository.getMovies { (movies, error) in
        moviesResponse = movies
        moviesExpectation.fulfill()
      }
      waitForExpectations(timeout: 1) { (error) in
        XCTAssertNotNil(moviesResponse)
      }
    }
    
    func testGetMoviesWhenResponseErrorReturnsError() {
      let apiRespository = APIRepository()
      let error = NSError(domain: "error", code: 1234, userInfo: nil)
      let mockURLSession  = MockURLSession(data: nil, urlResponse: nil, error: error)
      apiRespository.session = mockURLSession
      let errorExpectation = expectation(description: "error")
      var errorResponse: Error?
      apiRespository.getMovies { (movies, error) in
        errorResponse = error
        errorExpectation.fulfill()
      }
      waitForExpectations(timeout: 1) { (error) in
        XCTAssertNotNil(errorResponse)
      }
    }

}
