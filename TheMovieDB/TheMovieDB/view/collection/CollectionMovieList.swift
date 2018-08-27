//
//  CollectionMovieList.swift
//  TheMovieDB
//
//  Created by Diego Andres Mazo Munoz on 8/27/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class CollectionMovieList: UICollectionView, List {
    
    var listDelegate: MoviesListDelegate?
    
    init(){
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width:151, height:151)
        super.init(frame: CGRect.zero, collectionViewLayout: layout)
        self.backgroundColor? = UIColor.white
        
        self.register(UINib(nibName: "MyCollectionCell", bundle: .main), forCellWithReuseIdentifier: "MyCollectionCell")
        
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionMovieList: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (listDelegate?.numberOfItems())!
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = dequeueReusableCell(withReuseIdentifier: "MyCollectionCell", for: indexPath) as! ListCell
        listDelegate?.configureCell(cell: cell, atIndexPath: indexPath)
        
        return cell as! UICollectionViewCell
    }
}

extension CollectionMovieList: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        listDelegate?.didSelectRowAt(indexPath: indexPath)
    }
}
