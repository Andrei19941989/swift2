//
//  ViewController.swift
//  CalcKulinar
//

//

import UIKit

class CalcController: UIViewController {
    
    var positions = [Position]() {
        didSet {
            mainView.tableView.reloadData()
        }
    }
    
    var initialMeasure = measures[0] {
        didSet {
            self.mainView.initialMeasureTF.text = initialMeasure.title
        }
    }
    
    var resultMeasure = measures[3] {
        didSet {
            self.mainView.resultMeasureTF.text = resultMeasure.title
        }
    }
    
    var isInit = true
    var ingredient = ingredients[0] {
        didSet {
            mainView.ingredientTF.text = ingredient.title
        }
    }
    
    var result = 0.0
    
    let mainView = CalcView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        addDelegates()
        addTargets()
    }
    
    func memory() {
        
        let ingredient = self.ingredient
        let measure = self.resultMeasure
        guard let countStr = self.mainView.resultQuantityLabel.text else {
            return
        }
        guard let count = Double(countStr) else {
            return
        }
        
        let position = Position(title: ingredient.title,
                                count: count,
                                measure: measure.title)
        
        self.positions.append(position)
        
    }
    
    func calculate() {
        
        //1. Достать исходное число из TF
        guard let initNumberStr = mainView.initialQuantityTF.text else {
            return
        }
        
        guard let initNumber = Double(initNumberStr) else {
            return
        }
        
        //2. Обработать типы мер
        
        let initType = initialMeasure.measureType
        let resultType = resultMeasure.measureType
        
        //3. Посчитать результат
        
        
        // - Вес -> Вес
        // koeff * value = koeff2 * value2
        // value2 = koeff * value / koeff2
        
        // - Объём -> Объём
        // koeff * value = koeff2 * value2
        // value2 = koeff * value / koeff2
        
        // - Вес -> Объём
        //weight = volume * density
        
        // - Объём -> Вес
        
        var result = 0.0
        
        switch (initType, resultType) {
        case (.weight , .weight), (.volume, .volume):
            result = initNumber * resultMeasure.coeff / initialMeasure.coeff
        case (.weight, .volume):
            result = (initNumber * resultMeasure.coeff / initialMeasure.coeff) / self.ingredient.density
        case (.volume, .weight):
            result = (initNumber * resultMeasure.coeff / initialMeasure.coeff) * self.ingredient.density
        }
        
        mainView.resultQuantityLabel.text = "\(result)"
    }
    
    
    func addTargets() {
        
        let calcTap = UIAction { _ in
            self.calculate()
        }
        
        let memoryTap = UIAction { _ in
            self.memory()
        }
        
        mainView.solveButton.addAction(calcTap,
                                       for: .touchUpInside)
        mainView.memoryButton.addAction(memoryTap,
                                        for: .touchUpInside)
        
        let action = UIAction { _ in
            
            let actionSheet = UIAlertController(title: nil,
                                                message: "Что вы хотите добавить?",
                                                preferredStyle: .actionSheet)
            
            let ingredientAction = UIAlertAction(title: "Ингредиент", style: .default) { _ in
                let vc = AddIngredientController()
                self.present(vc, animated: true)
            }
            
            let measureAction = UIAlertAction(title: "Меру", style: .default) { _ in
                let vc = AddMeasureController()
                self.present(vc, animated: true)
            }
            
            let cancelAction = UIAlertAction(title: "Передумалось", style: .cancel, handler: nil)
            
            actionSheet.addAction(ingredientAction)
            actionSheet.addAction(measureAction)
            actionSheet.addAction(cancelAction)
            
            self.present(actionSheet, animated: true)
        }
        
        mainView.addIngredientButton.addAction(action, for: .touchUpInside)
    }
    
    func addDelegates() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.measurePicker.dataSource = self
        mainView.measurePicker.delegate = self
        mainView.ingredientPicker.dataSource = self
        mainView.ingredientPicker.delegate = self
        mainView.resultMeasureTF.delegate = self
        mainView.initialMeasureTF.delegate = self
    }
    
    
    
}

extension CalcController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == mainView.initialMeasureTF {
            isInit = true
        } else  {
            isInit = false
        }
    }
}

extension CalcController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == mainView.measurePicker {
            return measures.count
        } else {
            return ingredients.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == mainView.measurePicker {
            return measures[row].title
        } else {
            return ingredients[row].title
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == mainView.measurePicker {
            if isInit {
                self.initialMeasure = measures[row]
            } else {
                self.resultMeasure = measures[row]
            }
        } else {
            self.ingredient = ingredients[row]
            view.endEditing(true)
        }
    }
}

extension CalcController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return positions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.reuseID, for: indexPath) as! IngredientCell
        
        cell.ingredientLabel.text = positions[indexPath.row].title
        cell.countLabel.text = "\(positions[indexPath.row].count) \(positions[indexPath.row].measure)"
        
        cell.backgroundColor = .clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive,
                                              title: "Удалить") { _, _, _ in
            
            self.positions.remove(at: indexPath.row)
            
        }
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
            
        return config
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
}
