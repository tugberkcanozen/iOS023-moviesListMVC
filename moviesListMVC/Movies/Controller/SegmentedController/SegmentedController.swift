//
//  SegmentedController.swift
//  moviesListMVC
//
//  Created by Tuğberk Can Özen on 7.05.2022.
//

import UIKit

class SegmentedController: UIPageViewController {

    enum Appearance: Int {
        case topMovie
        case kidsMovie
    }

    var topMovieSection : Appearance = .topMovie
    let kidsMovieSection: Appearance = .kidsMovie
    
    @IBOutlet weak var segmentedSectionsOutlet: UISegmentedControl!
    
    lazy var topMovieController: TopMoviesList = {
        return storyboard!.instantiateViewController(identifier: "TopMovie")
    }()
    
    lazy var kidsMovieController: KidsMoviesList = {
        return storyboard!.instantiateViewController(identifier: "KidsMovie")
    }()
    
    var managedControllers: [UIViewController] {
        return [topMovieController, kidsMovieController]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCurrentController(animated: false)
    }
    
    func updateCurrentController(animated: Bool) {
        
        switch topMovieSection {
            
        case .topMovie:
            setViewControllers([topMovieController], direction: .reverse, animated: false, completion: nil)
            
        case .kidsMovie:
            setViewControllers([kidsMovieController], direction: .forward, animated: false, completion: nil)
        }
    }

    @IBAction func segmentedSectionsAction(_ sender: UISegmentedControl) {
        
        if let newAppearance = Appearance(rawValue: sender.selectedSegmentIndex) {
            
            topMovieSection = newAppearance
            updateCurrentController(animated: false)
        }
    }
    
}
