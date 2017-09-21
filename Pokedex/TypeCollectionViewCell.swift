//
//  TypeCollectionViewCell.swift
//  Pokedex
//
//  Created by Stephen Jayakar on 9/20/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class TypeCollectionViewCell: UICollectionViewCell {
    var typeImageView: UIImageView!
    override func awakeFromNib() {
        typeImageView = UIImageView(frame: contentView.frame)
        typeImageView.contentMode = .scaleAspectFill
        typeImageView.clipsToBounds = true
        contentView.addSubview(typeImageView)
    }
}
