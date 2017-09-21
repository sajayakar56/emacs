//
//  CollectionViewCell.swift
//  Pokedex
//
//  Created by Carol Wang on 9/19/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    var pokemonImage: UIImageView! //image view containing image of pokemon
    
    override func awakeFromNib() {
        pokemonImage = UIImageView(frame: CGRect(x: contentView.frame.width * 0.15, y: contentView.frame.height * 0.15, width: contentView.frame.width * 0.7, height: contentView.frame.height * 0.7))
        pokemonImage.contentMode = .scaleAspectFill
        contentView.addSubview(pokemonImage)
    }
    
}
