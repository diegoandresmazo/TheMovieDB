//
//  Movie.swift
//  TheMovieDB
//
//  Created by Diego Andres Mazo Munoz on 8/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    
    var id: Int
    var voteAverage : Double
    var title: String
    var popularity: Double
    var imageLink: String?
    var imageMovie: UIImage?
    
    init(id:Int, voteAverage:Double, title:String, popularity:Double, imageLink:String, imageMovie:UIImage) {
        
        self.id = id
        self.voteAverage = voteAverage
        self.title = title
        self.popularity = popularity
        self.imageLink = "https://image.tmdb.org/t/p/w154/" + imageLink
        self.imageMovie = imageMovie
    }
    
}
