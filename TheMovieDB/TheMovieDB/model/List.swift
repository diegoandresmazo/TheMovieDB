//
//  List.swift
//  TheMovieDB
//
//  Created by Diego Andres Mazo Munoz on 8/27/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

protocol List: class {
    weak var listDelegate: MoviesListDelegate? {get set}
    func reloadData()
}
