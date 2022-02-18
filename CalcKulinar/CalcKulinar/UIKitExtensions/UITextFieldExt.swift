//
//  UITextFieldExt.swift
//  CalcKulinar
//

//

import UIKit

extension UITextField {
    
    convenience init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
        self.layer.cornerRadius = 12
        self.backgroundColor = .white
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        leftViewMode = .always
    }

}
