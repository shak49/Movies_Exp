//
//  MockURLSession.swift
//  Movies_Exp
//
//  Created by Shak Feizi on 11/1/21.
//

import Foundation


class MockURLSession: URLSession {
    // SHAK: Properties
    var cachedURL: URL?
    
    // SHAK: Functions
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.cachedURL = url
        return URLSessionDataTask()
    }
}
