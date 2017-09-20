//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Carol Wang on 9/19/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel!   //Pokemon Name Label
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Setting up Name Label
        nameLabel = UILabel(frame: CGRect(x: 20, y: contentView.frame.height * (1/4), width: 150, height: contentView.frame.height * (1/2)))
        nameLabel.textColor = UIColor.black
        contentView.addSubview(nameLabel)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
