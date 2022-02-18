//
//  AddMeasureController.swift
//  CalcKulinar
//

//

import UIKit

class AddMeasureController: UIViewController {

    let mainView = AddMeasureView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        addActions()
    }
    
    func addActions() {
        
        let saveMeasureAction = UIAction { _ in
            
            guard let title = self.mainView.titleTF.text else {
                return
            }
            
            guard let koeffStr = self.mainView.koeffTF.text else {
                return
            }
            
            guard let koeff = Double(koeffStr) else {
                return
            }
            let type: MeasureType = self.mainView.measureTypeSC.selectedSegmentIndex == 0 ? .weight : .volume
            let measure = Measure(measureType: type, title: title, coeff: koeff)
            measures.append(measure)
            
            self.dismiss(animated: true)
        }
        
        self.mainView.saveButton.addAction(saveMeasureAction, for: .touchUpInside)
    }

}
