//
//  UIButtonExt.swift
//  CalcKulinar
//

//

import UIKit

extension UIButton {
    
    convenience init(title: String,
                     font: UIFont,
                     textColor: UIColor,
                     bgColor: UIColor) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.titleLabel?.textColor = textColor
        self.backgroundColor = bgColor
        self.layer.cornerRadius = 12
        self.tintColor = textColor
    }
    
    
    
}

