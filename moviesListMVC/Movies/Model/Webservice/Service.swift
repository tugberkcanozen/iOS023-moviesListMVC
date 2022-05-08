//
//  Service.swift
//  moviesListMVC
//
//  Created by Tuğberk Can Özen on 7.05.2022.
//

import Foundation

struct Webservice {
    
    func fetchAllDatas(url: URL, res: @escaping ([Result]?) -> () ) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    res(nil)
                
                } else if let data = data {
                    let movieList = try? JSONDecoder().decode(DataModel.self, from: data)
                    
                    if let movieList = movieList {
                        res(movieList.results)
                    }
                }
            }
            .resume()
        }
        
    }
