//
//  UILabelExt.swift
//  CalcKulinar
//

//

import UIKit

extension UILabel {
    
    convenience init(text: String,
                     font: UIFont,
                     textColor: UIColor,
                     bgColor: UIColor = .clear) {
        self.init()
        
        self.text = text
        self.textColor = textColor
        self.font = font
        self.backgroundColor = bgColor
        
    }

}
