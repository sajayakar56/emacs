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
        typeImageView.backgroundColor = UIColor(white: 1, alpha: 0)
        typeImageView.layer.cornerRadius = 8
        contentView.addSubview(typeImageView)
    }
    
    // consider adding a lerp function
    func selectViewCell() {
        typeImageView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
    }
    
    func deselectViewCell() {
        typeImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }
}
