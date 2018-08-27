//
//  MoviesTableViewController.swift
//  TheMovieDB
//
//  Created by Diego Andres Mazo Munoz on 8/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    private let webService = WebServices()
    var movies = [Movie]()

    override func viewDidLoad() {
        getMovies()
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMovies", for: indexPath) as! TableViewCell
        
        cell.titleLabel.text = movie.title
        cell.popularityLabel.text = String (movie.popularity)
        cell.voteAverageLabel.text = String (movie.voteAverage)
        
        //prepareForReuse
        
        
        
        return cell
    }
    
    func getMovies(){
        
        webService.getMovies { movies in
            
            self.movies = movies
            self.table.reloadData()
        }
    }
    
}
