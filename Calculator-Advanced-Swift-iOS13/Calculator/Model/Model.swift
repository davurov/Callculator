//
//  Model.swift
//  Calculator
//
//  Created by Abduraxmon on 25/11/22.

import Foundation

struct Modul {
    
    private var number: Double?
    private var intermediatCalculator : (n1: Double, caclMeth: String)?
    
    mutating func setNumber(_ number: Double ) {
        self.number = number
    }
   
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-": return n * -1
            case "AC": return 0
            case "%": return n / 100
            case "=": return performeTwoNumberCalculation(n2: n)
            default: intermediatCalculator = (n1: n, caclMeth: symbol)
            }
        }
        return nil
    }
    
    
    private func performeTwoNumberCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediatCalculator?.n1, let operation = intermediatCalculator?.caclMeth {
            
            switch operation {
            case "+": return n1 + n2
            case "-": return n1 - n2
            case "×": return n1 * n2
            case "÷": return n1 / n2
            default: fatalError("operatin does not match to symbol")
            }
        }
        
        return nil
    }
        
    }
