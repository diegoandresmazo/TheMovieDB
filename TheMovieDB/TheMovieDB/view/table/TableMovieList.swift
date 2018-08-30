//
//  TableMovieList.swift
//  TheMovieDB
//
//  Created by Diego Andres Mazo Munoz on 8/27/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class TableMovieList: UITableView, List {
    var listDelegate: MoviesListDelegate?
    
    init(){
        super.init(frame: CGRect.zero, style: .plain)
        self.dataSource = self
        self.delegate = self
        self.register(UINib(nibName: "MyTableCell", bundle: nil), forCellReuseIdentifier: "MyTableCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        }
    }

extension TableMovieList: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (listDelegate?.numberOfItems())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = dequeueReusableCell(withIdentifier: "MyTableCell", for: indexPath) as! ListCell
        listDelegate?.configureCell(cell: cell, atIndexPath: indexPath)
        
        return cell as! UITableViewCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        listDelegate?.willDisplay(indexPath: indexPath)
    }
}

extension TableMovieList: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        listDelegate?.didSelectRowAt(indexPath: indexPath)
    }
}
