//
//  MockURLSession.swift
//  Movies_Exp
//
//  Created by Shak Feizi on 11/1/21.
//

import UIKit


class MockURLSession: URLSession {
    // SHAK: Properties
    var cachedURL: URL?
    private let mockTask: MockTask
    
    // SHAK: Initializers
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        mockTask = MockTask(data: data, urlResponse: urlResponse, error: error)
    }
    
    // SHAK: Functions
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.cachedURL = url
        mockTask.completionHandler = completionHandler
        return mockTask
    }
}

class MockTask: URLSessionDataTask {
  let data: Data?
  let urlResponse: URLResponse?
  let _error: Error?

  var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
  init(data: Data?, urlResponse: URLResponse?, error: Error?) {
    self.data = data
    self.urlResponse = urlResponse
    self._error = error
  }
  override func resume() {
    DispatchQueue.main.async {
        self.completionHandler?(self.data, self.urlResponse, self._error)
    }
  }
}
