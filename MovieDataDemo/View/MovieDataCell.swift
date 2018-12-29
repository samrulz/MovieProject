//
//  MovieDataCell.swift
//  MovieDataDemo
//
//  Created by SAGAR THAKARE on 29/12/18.
//  Copyright © 2018 Sandip Musale. All rights reserved.
//

import UIKit

class MovieDataCell: UITableViewCell {
    @IBOutlet weak var lblDataName: UILabel!
    @IBOutlet weak var lblDataDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblDataName.font = UIFont.boldSystemFont(ofSize: 20.0)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
