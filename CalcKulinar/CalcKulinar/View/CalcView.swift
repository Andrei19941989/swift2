//
//  CalcView.swift
//  CalcKulinar
//

//

import UIKit

class CalcView: UIView {
    
    let bgImageView = UIImageView(image: UIImage(named: "bg"))
    let titleLabel = UILabel(text: "CalcKulinal",
                             font: .systemFont(ofSize: 18),
                             textColor: .black)
    let initialQuantityTF = UITextField(placeholder: "Количество...")
    let initialMeasureTF = UITextField(placeholder: "Мера...")
    let resultQuantityLabel = UILabel(text: "0.00",
                                      font: .systemFont(ofSize: 24),
                                      textColor: .white)
    let resultMeasureTF = UITextField(placeholder: "Мера...")
    let ingredientTF = UITextField(placeholder: "Выберите ингредиент")
    let solveButton = UIButton(title: "Посчитать",
                               font: .systemFont(ofSize: 18, weight: .bold),
                               textColor: .white,
                               bgColor: .systemGreen)
    let memoryButton = UIButton(title: "Запомнить",
                               font: .systemFont(ofSize: 18, weight: .bold),
                               textColor: .white,
                               bgColor: .systemMint)
    let tableView = UITableView()
    
    let measurePicker = UIPickerView()
    let ingredientPicker = UIPickerView()
    
    let addIngredientButton = UIButton(title: "",
                                       font: .systemFont(ofSize: 24),
                                       textColor: .white,
                                       bgColor: .systemOrange)
    
    init() {
        super.init(frame: CGRect())
        
        backgroundColor = .systemMint
        
        setConstraints()
        setViews()
    }
    
    func setViews() {
        
        bgImageView.contentMode = .scaleAspectFill
        resultQuantityLabel.textAlignment = .center
        resultQuantityLabel.backgroundColor = UIColor(named: "blackAlpha")
        resultQuantityLabel.layer.cornerRadius = 12
        resultQuantityLabel.clipsToBounds = true
        
        tableView.backgroundColor = UIColor(named: "blackAlpha")
        tableView.layer.cornerRadius = 12
        tableView.register(IngredientCell.self,
                           forCellReuseIdentifier: IngredientCell.reuseID)
        
        initialQuantityTF.keyboardType = .decimalPad
        
        initialMeasureTF.inputView = measurePicker
        resultMeasureTF.inputView = measurePicker
        ingredientTF.inputView = ingredientPicker
        
        addIngredientButton.layer.cornerRadius = 32
        addIngredientButton.setImage(UIImage(systemName: "plus"), for: .normal)
    }
    
    func setConstraints() {
        
        let initialStack = UIStackView(views: [initialQuantityTF, initialMeasureTF],
                                       axis: .horizontal,
                                       spacing: 8)
        let resultStack = UIStackView(views: [resultQuantityLabel, resultMeasureTF],
                                      axis: .horizontal,
                                      spacing: 8)
        
        let stack = UIStackView(views: [titleLabel,
                                        initialStack,
                                        resultStack,
                                        ingredientTF,
                                        solveButton,
                                        memoryButton,
                                        tableView],
                                axis: .vertical,
                                spacing: 12)
        
        for view in stack.arrangedSubviews {
            if view is UITextField || view is UIButton || view is UIStackView {
                view.heightAnchor.constraint(equalToConstant: 48).isActive = true
            }
        }
        
        initialMeasureTF.widthAnchor.constraint(equalTo: resultMeasureTF.widthAnchor).isActive = true
        initialMeasureTF.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        addSubview(bgImageView)
        addSubview(stack)
        addSubview(addIngredientButton)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        addIngredientButton.translatesAutoresizingMaskIntoConstraints = false
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 54),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
                                    ])
        
        NSLayoutConstraint.activate([addIngredientButton.widthAnchor.constraint(equalToConstant: 64),
                                     addIngredientButton.heightAnchor.constraint(equalToConstant: 64),
                                     addIngredientButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                                                   constant: -12),
                                     addIngredientButton.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                                                 constant: -16),
                                    ])
        
        
        
        NSLayoutConstraint.activate([
            bgImageView.topAnchor.constraint(equalTo: self.topAnchor),
            bgImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bgImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
