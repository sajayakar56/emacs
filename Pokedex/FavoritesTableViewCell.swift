//
//  FavoritesTableViewCell.swift
//  Pokedex
//
//  Created by Carol Wang on 9/21/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    var nameLabel: UILabel!   //Pokemon Name Label
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Setting up Name Label
        nameLabel = UILabel(frame: CGRect(x: 20, y: contentView.frame.height * (1/4), width: contentView.frame.width, height: contentView.frame.height * (1/2)))
        nameLabel.textColor = UIColor.black
        contentView.addSubview(nameLabel)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
