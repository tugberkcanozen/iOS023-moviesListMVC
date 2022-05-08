//
//  KidsMovieCell.swift
//  moviesListMVC
//
//  Created by Tuğberk Can Özen on 7.05.2022.
//

import UIKit
import Kingfisher

class KidsMovieCell: UITableViewCell {

    @IBOutlet weak var kidsMovieImage: UIImageView!
    @IBOutlet weak var kidsMovieLanguage: UILabel!
    @IBOutlet weak var kidsMovieTitle: UILabel!
    @IBOutlet weak var kidsMovieDetail: UILabel!
    @IBOutlet weak var kidsMovieVote: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        kidsMovieImage.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func saveModel(model: Result) {
        
        kidsMovieTitle.text = model.title
        kidsMovieDetail.text = model.overview
        kidsMovieVote.text = "Score: \(String(model.vote_average))"
        kidsMovieLanguage.text = "Language: \(model.original_language.uppercased())"
        kidsMovieImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w1280" + model.poster_path ))
    }
    
}
