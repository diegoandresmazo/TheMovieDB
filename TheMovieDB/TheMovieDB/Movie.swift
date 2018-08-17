//
//  Movie.swift
//  TheMovieDB
//
//  Created by Diego Andres Mazo Munoz on 8/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation

class Movie {
    
    var id: Int
    var voteAverage : Double
    var title: String
    var popularity: Double
    
    init(id:Int, voteAverage: Double, title: String, popularity: Double) {
        
        self.id = id
        self.voteAverage = voteAverage
        self.title = title
        self.popularity = popularity
    }
    
}
