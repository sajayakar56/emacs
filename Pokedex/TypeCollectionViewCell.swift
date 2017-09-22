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
        typeImageView.backgroundColor = UIColor.green
        typeImageView.layer.cornerRadius = 8
        contentView.addSubview(typeImageView)
    }
    
    // consider adding a lerp function
    func selectViewCell() {
//        typeImageView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        UIView.animate(withDuration: 0.3, animations: {
            self.typeImageView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
//            self.typeImageView.frame = CGRect(x: self.typeImageView.frame.minX, y: self.typeImageView.frame.minY, width: self.typeImageView.frame.width * 0.75, height: self.typeImageView.frame.height * 0.75)
//            self.typeImageView.center = CGPoint(x: self.contentView.frame.width * 0.5, y: self.contentView.frame.height * 0.5)
        })
    }
    
    func deselectViewCell() {
        UIView.animate(withDuration: 0.3, animations: {
            self.typeImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
}
