//
//  MoviesListDelegate.swift
//  TheMovieDB
//
//  Created by Diego Andres Mazo Munoz on 8/27/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

protocol MoviesListDelegate: class {
    
    func numberOfItems() -> Int
    func configureCell(cell: ListCell, atIndexPath: IndexPath)
    func didSelectRowAt(indexPath: IndexPath)
}

