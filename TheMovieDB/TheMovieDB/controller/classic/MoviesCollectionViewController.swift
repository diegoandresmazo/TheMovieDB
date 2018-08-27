//
//  MoviesCollectionViewController.swift
//  TheMovieDB
//
//  Created by Diego Andres Mazo Munoz on 8/21/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MoviesCollectionViewController: UICollectionViewController {
    
    private let webService = WebServices()
    var movies = [Movie]()
    
    @IBOutlet var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovies()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = movies[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell
        let linkMovie = "https://image.tmdb.org/t/p/w500" + movie.imageLink!
        let urlLinkMovie = URL(string: linkMovie)
        
        cell.imageCell.af_setImage(withURL: urlLinkMovie!)
        cell.titleCell.text = movie.title
        return cell
    }
    

    func getMovies(){
        webService.getMovies { movies in
            self.movies = movies
            self.myCollectionView.reloadData()
        }
    }
}
