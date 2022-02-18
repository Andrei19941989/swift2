//
//  AddIngredientController.swift
//  CalcKulinar
//

//

import UIKit

class AddIngredientController: UIViewController {
    
    let mainView = AddIngredientView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = mainView
        addTargets()
        
    }
    
    func addTargets() {
        let addIngredient = UIAction { _ in
            
            guard let title = self.mainView.titleIngredientTF.text, title.count > 1 else {
                return
            }
            
            guard let densityStr = self.mainView.densytiIngredientTF.text else {
                return
            }
            
            guard let density = Double(densityStr) else {
                return
            }
            
            let ingredient = Ingredient(title: title, density: density)
            
            if !ingredients.contains(ingredient) {
                ingredients.append(ingredient)
                self.dismiss(animated: true)
            }
        }
        
        mainView.saveButton.addAction(addIngredient, for: .touchUpInside)
        
    }
    
    
    
    func tapSaveButton(button: UIButton) {
        if button == mainView.saveButton {
            
            guard let text = mainView.densytiIngredientTF.text else {return}
            guard let _ = Double(text) else {
                print("Значение \(mainView.densytiIngredientTF) не является числом ")
                return
            }
            print("Плотность - \(mainView.densytiIngredientTF) ")
        }
    }

}
