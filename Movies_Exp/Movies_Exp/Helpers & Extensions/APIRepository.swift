//
//  APIRepository.swift
//  Movies_Exp
//
//  Created by Shak Feizi on 11/1/21.
//

import Foundation


class APIRepository {
    // SHAK: Properties
    var session: URLSession!
    
    // SHAK: Functions
    func getMovies(completion: @escaping ([Movie]?, Error?) -> Void) {
        guard let url = URL(string: "https://mymovieslist.com/topmovies") else { fatalError() }
        session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                    completion(nil, error)
                    return
                  }
            guard let data = data else { return }
                  let movies = try! JSONDecoder().decode([Movie].self, from: data)
            completion(movies, nil)
        }
        .resume()
    }
}
