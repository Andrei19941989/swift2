//
//  AddMeasureView.swift
//  CalcKulinar
//

//

import UIKit

class AddMeasureView: UIView {

    let bgImageView = UIImageView(image: UIImage(named: "bg3"))
    let titleLabel = UILabel(text: "Добавить меру",
                             font: .systemFont(ofSize: 25,
                                               weight: .bold),
                             textColor: .white)
    let titleTF = UITextField(placeholder: "Название меры...")
    let koeffTF = UITextField(placeholder: "Сколько их в 1 кг?")
    let measureTypeSC = UISegmentedControl()
    let saveButton = UIButton(title: "Сохранить",
                              font: .systemFont(ofSize: 18,
                                                weight: .bold),
                              textColor: .systemMint,
                              bgColor: .white)
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .white
        setViews()
        setConstraints()
    }
    
    func setViews() {
        measureTypeSC.insertSegment(withTitle: "Вес", at: 0, animated: false)
        measureTypeSC.insertSegment(withTitle: "Объём", at: 1, animated: false)
        measureTypeSC.backgroundColor = UIColor(named: "blackAlpha")
        measureTypeSC.selectedSegmentIndex = 0
        measureTypeSC.selectedSegmentTintColor = .brown
        bgImageView.contentMode = .scaleAspectFill
        
        let changeSegment = UIAction { _ in
            if self.measureTypeSC.selectedSegmentIndex == 0 {
                self.koeffTF.placeholder = "Сколько их в 1 КГ?"
            } else {
                self.koeffTF.placeholder = "Сколько их в 1 литре?"
            }
        }
        
        measureTypeSC.addAction(changeSegment, for: .valueChanged)
        
    }
    
    
    
    func setConstraints() {
        
        let stack = UIStackView(views: [titleTF, koeffTF, measureTypeSC, saveButton],
                                axis: .vertical,
                                spacing: 12)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bgImageView)
        addSubview(stack)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            bgImageView.topAnchor.constraint(equalTo: self.topAnchor),
            bgImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bgImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bgImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -120),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
        ])
        
        NSLayoutConstraint.activate([titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     titleLabel.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -48)
                                    ])
        
        for view in stack.arrangedSubviews {
            view.heightAnchor.constraint(equalToConstant: 48).isActive = true
        }
        
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
