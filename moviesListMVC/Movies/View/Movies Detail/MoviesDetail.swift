//
//  Movies Detail.swift
//  moviesListMVC
//
//  Created by Tuğberk Can Özen on 7.05.2022.
//

import UIKit
import Kingfisher

class MoviesDetail: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    
    var targetMovieName = String()
    var targetMovieDetail = String()
    var targetMovieImage = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Bundle.main.loadNibNamed("MoviesDetail", owner: self, options: nil)
        overViewLabel?.text = targetMovieDetail
        movieNameLabel?.text = targetMovieName
        detailImageView.layer.cornerRadius = 70
        detailImageView?.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w1280" + targetMovieImage))
        
    }


}
