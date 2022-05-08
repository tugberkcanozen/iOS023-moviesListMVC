//
//  Movies List.swift
//  moviesListMVC
//
//  Created by Tuğberk Can Özen on 7.05.2022.
//

import UIKit
import Kingfisher

class TopMoviesList: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var service = Webservice()
    var results = [Result]()
    
    var selectedMovie = String()
    var selectedMovieDetail = String()
    var selectedMovieImage = String()
    private var moviesURL = Helpers()


    @IBOutlet weak var TopMovieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: String(describing: TopMovieCell.self), bundle: nil)
        TopMovieTableView.register(nib, forCellReuseIdentifier: String(describing: TopMovieCell.self))
        let url = moviesURL.topmovieUrl
        
        service.fetchAllDatas(url: url!) { data in
            self.results = data!
            
            DispatchQueue.main.async {
                self.TopMovieTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TopMovieCell.self), for: indexPath) as! TopMovieCell
        cell.saveModel(model: results[indexPath.row])
        return cell
    
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        
        selectedMovie = results[indexPath.row].title
        selectedMovieDetail = results[indexPath.row].overview
        selectedMovieImage = results[indexPath.row].poster_path
        
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC" {
            
            let destination = segue.destination as! MoviesDetail
            
            destination.targetMovieDetail = selectedMovieDetail
            destination.targetMovieName = selectedMovie
            destination.targetMovieImage = selectedMovieImage
            
        }
    }
    
}
