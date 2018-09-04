//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let movieFacade = WebServices()
    var moviesList = [Movie]()
    var list: List!
    var numberOfPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch UIDevice.current.userInterfaceIdiom {
            case .phone:
                self.list = TableMovieList()
            case .pad:
                self.list = CollectionMovieList()
            default: self.list = TableMovieList()
        }
        
        self.list.listDelegate = self
        self.view.addSubview((self.list as! UIView))
        
   
        movieFacade.getMovies(numberOfPage: self.numberOfPage) { [weak self](movies) in
            self?.moviesList = movies
            self?.list.reloadData()
        }
        numberOfPage = numberOfPage + 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        (self.list as! UIView).frame = self.view.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: MoviesListDelegate{
    
    func willDisplay(indexPath: IndexPath) {
        
        if indexPath.row == moviesList.count-1 {
            movieFacade.getMovies(numberOfPage: self.numberOfPage) { [weak self](movies) in
                self?.moviesList.append(contentsOf: movies)
                self?.list.reloadData()
           }
        numberOfPage = numberOfPage + 1
        }
    }
    
    func numberOfItems() -> Int {
        return moviesList.count
    }
    
    func configureCell(cell: ListCell, atIndexPath: IndexPath) {
        
        
        let movie = moviesList[atIndexPath.row]
        cell.title?.text = movie.title
        let image_path = movie.imageLink
        
        if let imageURL = URL(string: image_path!){
            cell.movieImage?.af_setImage(withURL: imageURL)
            print("CARECHIMBA")
        }
    }
    
    func didSelectRowAt(indexPath: IndexPath){
        let selectedCell = indexPath.row
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        newViewController.movie = moviesList[selectedCell]
        
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}

