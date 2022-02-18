//
//  IngredientView.swift
//  CalcKulinar
//

//

import UIKit

class AddIngredientView: UIView {
    
    let bgImageViewIngredients = UIImageView(image: UIImage(named: "bg2"))
    
    // заголовок
    let titleLabel = UILabel(text: "Добавить ингредиент", font: .systemFont(ofSize: 25, weight: .bold), textColor: .white)

    // текстовое поле для название ингредиента и плотности
    let titleIngredientTF = UITextField(placeholder: "Название ингредиента...")
    let densytiIngredientTF = UITextField(placeholder: "Плотность ингредиента...")
    
    // кнопка сохранить

    let saveButton = UIButton(title: "Сохранить",
                              font: .systemFont(ofSize: 18, weight: .bold),
                              textColor: .systemMint,
                              bgColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    func setViews() {
        
       bgImageViewIngredients.contentMode = .scaleAspectFill
        
        titleLabel.textAlignment = .center
        saveButton.titleLabel?.textAlignment = .center
        densytiIngredientTF.keyboardType = .decimalPad
        
    
    }
    
    func setConstraints() {
        
        addSubview(bgImageViewIngredients)
        bgImageViewIngredients.translatesAutoresizingMaskIntoConstraints = false
        
        let textFieldStack = UIStackView(views: [titleIngredientTF,densytiIngredientTF],
                                         axis: .vertical,
                                         spacing: 20)
        
        let allStack = UIStackView(views: [titleLabel,textFieldStack, saveButton],
                              axis: .vertical,
                              spacing: 100)
        
        for field in textFieldStack.arrangedSubviews {
            field.heightAnchor.constraint(equalToConstant: 48).isActive = true
        }
        
        saveButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        addSubview(allStack)
        allStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            allStack.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            allStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            allStack.centerXAnchor.constraint(equalTo: centerXAnchor),

        ])
       
        NSLayoutConstraint.activate([
            bgImageViewIngredients.topAnchor.constraint(equalTo: self.topAnchor),
            bgImageViewIngredients.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bgImageViewIngredients.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bgImageViewIngredients.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    

    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
