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
    var pokemonName: UILabel!
    
    override func awakeFromNib() {
        
        pokemonImage = UIImageView(frame: CGRect(x: contentView.frame.width * 0.15, y: contentView.frame.height * 0.15, width: contentView.frame.width * 0.8, height: contentView.frame.height * 0.8))
        pokemonImage.contentMode = .scaleAspectFill
        contentView.addSubview(pokemonImage)
        
        pokemonName = UILabel(frame: CGRect(x: contentView.frame.width * 0.5, y: contentView.frame.height * 0.5, width: contentView.frame.width * 0.5, height: contentView.frame.height * 0.5))
        pokemonName.lineBreakMode = .byWordWrapping
        pokemonName.numberOfLines = 3
        pokemonName.font = pokemonName.font.withSize(12)
        contentView.addSubview(pokemonName)
    }
    
}
