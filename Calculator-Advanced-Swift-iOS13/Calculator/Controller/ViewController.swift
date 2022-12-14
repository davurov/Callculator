//
//  ViewController.swift
//  Calculator
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    var isFinishedNumber = false
    var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("can not display lable to double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = Modul()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedNumber = true
        calculator.setNumber(displayValue)
        
        if let calckMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calckMethod ) {
                displayValue = result
            }
            }
        }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        
        if let numValue = sender.currentTitle {
            if isFinishedNumber {
                displayLabel.text = numValue
                isFinishedNumber = false
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                       
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}



