//
//  UIStackViewExt.swift
//  CalcKulinar
//

//

import UIKit

extension UIStackView {
    
    convenience init(views: [UIView],
                     axis: NSLayoutConstraint.Axis,
                     spacing: CGFloat) {
        
        self.init(arrangedSubviews: views)
        self.axis = axis
        self.spacing = spacing
        
    }
    
}

