//
//  Helpers.swift
//  moviesListMVC
//
//  Created by Tuğberk Can Özen on 7.05.2022.
//

import Foundation

var baseURL = "https://api.themoviedb.org/3/discover/movie?"
var apiKey = "59d1ea6d131e11d3a7f4921da8243138"

struct Helpers {
    
    var topmovieUrl = URL(string: "\(baseURL)api_key=\(apiKey)")
    var kidsMovieUrl = URL(string: "\(baseURL)certification_country=US&certification.lte=G&api_key=\(apiKey)")
}

