//
//  MoviesModel.swift
//  moviesListMVC
//
//  Created by Tuğberk Can Özen on 7.05.2022.
//

import Foundation

struct DataModel: Codable {
    
    let results: [Result]
}

// MARK: - Result

struct Result: Codable {
    
    let title: String
    let overview: String
    let poster_path: String
    let original_language: String
    let vote_average: Double
    //    let release_date: String

}
