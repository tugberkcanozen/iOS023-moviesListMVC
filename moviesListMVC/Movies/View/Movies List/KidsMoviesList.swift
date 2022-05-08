//
//  KidsMoviesList.swift
//  moviesListMVC
//
//  Created by Tuğberk Can Özen on 7.05.2022.
//

import UIKit

class KidsMoviesList: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var service = Webservice()
    var results = [Result]()
    
    var selectedMovie = String()
    var selectedMovieDetail = String()
    var selectedMovieImage = String()
    private var moviesURL = Helpers()

    
    @IBOutlet weak var KidsMovieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: String(describing: KidsMovieCell.self), bundle: nil)
        KidsMovieTableView.register(nib, forCellReuseIdentifier: String(describing: KidsMovieCell.self))
        let url = moviesURL.kidsMovieUrl
        
        service.fetchAllDatas(url: url!) { data in
            self.results = data!
            
            DispatchQueue.main.async {
                self.KidsMovieTableView.reloadData()
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: KidsMovieCell.self), for: indexPath) as! KidsMovieCell
        cell.saveModel(model: results[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        
        selectedMovie = results[indexPath.row].title
        selectedMovieDetail = results[indexPath.row].overview
        selectedMovieImage = results[indexPath.row].poster_path
        
        performSegue(withIdentifier: "toKidsMovieVC", sender: nil)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toKidsMovieVC" {
            
            let destination = segue.destination as! MoviesDetail
            
            destination.targetMovieDetail = selectedMovieDetail
            destination.targetMovieName = selectedMovie
            destination.targetMovieImage = selectedMovieImage
            
        }
    }
    
}
