//
//  WebServices.swift
//  TheMovieDB
//
//  Created by Diego Andres Mazo Munoz on 8/16/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class WebServices {


private let linkRequest = "https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US&page="
    
    
    func getMovies(numberOfPage: Int, completionHandler: @escaping ([Movie]) -> Void) {
        
        
           let completeLink = self.linkRequest + String (numberOfPage)
        
           var movies = [Movie]()
        
             Alamofire.request(completeLink).responseJSON { response in
                
                if let json = response.result.value {
                if let dictionary = json as? [String: Any] {
                    
                if let dictionaryResults = dictionary["results"] as? [[String: Any]] {
            
                            for object in dictionaryResults{
                                
                                let id = object["id"] as! Int
                                let voteAverage = object["vote_average"] as! Double
                                let title = object["title"] as! String
                                let popularity = object["popularity"] as! Double
                                let imageLink = object["poster_path"] as! String
                                let release = object["release_date"] as! String
                                let resume = object["overview"] as! String
                                
                                let movie = Movie(id: id, voteAverage: voteAverage, title: title, popularity: popularity, imageLink: imageLink, imageMovie: #imageLiteral(resourceName: "Movie_night"), releaseDate: release, resume: resume)
    
                                movies.append(movie)
                            }
                        completionHandler(movies)
                    }
             }
            }
        }
    }
}
