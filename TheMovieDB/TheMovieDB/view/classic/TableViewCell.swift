//
//  TableViewCell.swift
//  TheMovieDB
//
//  Created by Diego Andres Mazo Munoz on 8/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
     
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
