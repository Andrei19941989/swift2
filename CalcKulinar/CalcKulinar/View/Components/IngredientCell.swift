//
//  IngredientCell.swift
//  CalcKulinar
//

//

import UIKit

class IngredientCell: UITableViewCell {
    
    static let reuseID = "IngredientCell"
    
    let ingredientLabel = UILabel(text: "Сахар тростниковый",
                                  font: .systemFont(ofSize: 18,
                                                    weight: .bold),
                                  textColor: .white)
    
    let countLabel = UILabel(text: "1800 мг",
                             font: .systemFont(ofSize: 18,
                                               weight: .bold),
                             textColor: .white)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stack = UIStackView(views: [ingredientLabel, countLabel],
                                axis: .horizontal,
                                spacing: 24)
        
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([stack.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                                     stack.centerXAnchor.constraint(equalTo: centerXAnchor)])
        
        countLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
