//
//  MyTableCell.swift
//  TheMovieDB
//
//  Created by Diego Andres Mazo Munoz on 8/27/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class MyTableCell: UITableViewCell, ListCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    override func prepareForReuse() {
        print("Prepare for reuse")
    }
}
