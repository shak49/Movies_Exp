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
        session.dataTask(with: url) { (_, _, _) in }
    }
}
