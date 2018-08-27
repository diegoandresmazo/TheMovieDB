//
//  ListCell.swift
//  TheMovieDB
//
//  Created by Diego Andres Mazo Munoz on 8/27/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

protocol ListCell: class {
    weak var title: UILabel! {get}
    weak var movieImage: UIImageView! {get}
}
