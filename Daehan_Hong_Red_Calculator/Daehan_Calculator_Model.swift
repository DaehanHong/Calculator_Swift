//
//  Daehan_Calculator_Model.swift
//  Daehan_Hong_Red_Calculator
//
//  Created by Daehan Hong on 2019-09-11.
//  Copyright © 2019 Daehan Hong. All rights reserved.
//

import Foundation

class Daehan_Calculator_Model {
    var firstNumber : Double?
    var secondNumber : Double?
    var operation : String?
    
    func updateNumber(newNumber : Double) {
        if(firstNumber == nil) {
            firstNumber = newNumber
        } else if(operation == nil) {
            firstNumber = newNumber
        } else {
            secondNumber = newNumber
        }
    }
    
    func getResult() -> Double {
        var result: Double
        switch operation {
        case "+":
            result = firstNumber! + secondNumber!
        case "-":
            result = firstNumber! - secondNumber!
        case "x":
            result = firstNumber! * secondNumber!
        case "/":
            result = firstNumber! / secondNumber!
        case "√":
            result = sqrt(firstNumber!)
        case "^2":
            result = firstNumber! * firstNumber!
        case "%":
            result = (firstNumber! / 100) * secondNumber!
        default:
            return 0.0
        }
        
        return result
    }
    
    func reset() {
        firstNumber = nil
        secondNumber = nil
        operation = nil
    }
}

