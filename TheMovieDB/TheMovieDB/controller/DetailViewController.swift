//
//  DetailViewController.swift
//  TheMovieDB
//
//  Created by Diego Andres Mazo Munoz on 8/27/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movie: Movie!
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareMovie(movie: self.movie)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func prepareMovie(movie: Movie!){
        let image_path = movie.imageLink
        
        if let imageURL = URL(string: image_path!){
            detailImage.af_setImage(withURL: imageURL)
        }
        detailTitle.text = movie.title
    }
    
}
