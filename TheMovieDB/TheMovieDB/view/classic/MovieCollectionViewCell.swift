//
//  MovieCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Diego Andres Mazo Munoz on 8/21/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    
    override func prepareForReuse() {
        imageCell.image = nil
    }
}
