//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiKey = "1f4d7de5836b788bdfd897c3e0d0a24b"
        let linkRequest = "https://api.themoviedb.org/3/movie/top_rated?page=1&language=en-US&api_key=\(apiKey)"
        
        Alamofire.request(linkRequest).responseJSON { response in
            
            //print("Request: \(String(describing: response.request))")   // original url request
            //print("Response: \(String(describing: response.response))") // http url response
            //print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                
                if let dictionary = json as? [String: Any] {
                    
                //Número de páginas
                if let page = dictionary["page"] as? Int {
                    print("Number of pages:\(page)")
                    }
                    
                //Número Total de resultados
                if let totalResults = dictionary["total_results"] as? Int {
                        print("Number of pages:\(totalResults)")
                    }
                   
                //Número Total de páginas
                if let totalPages = dictionary["total_pages"] as? Int {
                        print("Number of pages:\(totalPages)")
                    }
                    
                //Resultados
                if let dictionaryResults = dictionary["results"] as? [[String: Any]] {
                        print("Number of Results:\(dictionaryResults.count)")
                    
                    
                    
                    
                    /*
                        id
                        vote_average
                        title
                        popularity
                    
                        */
                        
                    }
                    
                }

            }
            
        }
      
    }

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

