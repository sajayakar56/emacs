//
//  UILabel.swift
//  Pokedex
//
//  Created by Stephen Jayakar on 9/21/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

// from stackoverflow #1103148
class UIOutlinedLabel: UILabel {
    var outlineWidth: CGFloat = 3
    var outlineColor: UIColor = UIColor.black
    
    override func drawText(in rect: CGRect) {
        let strokeTextAttributes = [NSStrokeColorAttributeName: outlineColor,
                                    NSStrokeWidthAttributeName: -1 * outlineWidth] as [String : Any]
        self.attributedText = NSAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
        super.drawText(in: rect)
    }
}
