//
//  topMovieCell.swift
//  moviesListMVC
//
//  Created by Tuğberk Can Özen on 7.05.2022.
//

import UIKit
import Kingfisher

class TopMovieCell: UITableViewCell {

    @IBOutlet weak var TopMovieImage: UIImageView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        TopMovieImage.layer.cornerRadius = 15
    }
    
    func saveModel(model: Result) {
        
        titleLabel.text = model.title
        detailLabel.text = model.overview
        voteLabel.text = "Score: \(String(model.vote_average))"
        languageLabel.text = "Language: \(model.original_language.uppercased())"
        TopMovieImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w1280" + model.poster_path ))
    }
    
}
