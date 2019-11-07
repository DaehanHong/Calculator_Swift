//
//  ViewController.swift
//  Daehan_Hong_Red_Calculator
//
//  Created by Daehan Hong on 2019-09-11.
//  Copyright © 2019 Daehan Hong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- IBOutlets
    
    @IBOutlet weak var numberDisplay: UITextField!
    
    //MARK:- Other Variables
    var startNewNumber = true
    let calculatorModel = Daehan_Calculator_Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK:- IBActions
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        print (sender.currentTitle! + " button pressed")
        
        
        let buttonText = sender.currentTitle!

        var currentValue = numberDisplay.text!
        
        switch(buttonText) {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            // do something with the number
            if(startNewNumber) {
                currentValue = buttonText
            } else {
                currentValue = currentValue + buttonText
            }
            startNewNumber = false
            calculatorModel.updateNumber(newNumber: Double(currentValue)!)

        case ".":
            if(startNewNumber){
                currentValue = "0."
            } else {
                if(currentValue.contains(".")) {
                    // do nothing
                }else {
                    currentValue = currentValue + "."
                }
            }
            startNewNumber = false
            
        case "+", "-", "x", "/", "√", "^2", "%":
            if(calculatorModel.secondNumber != nil) {
                currentValue = String(calculatorModel.getResult())
                calculatorModel.firstNumber = calculatorModel.getResult()
                calculatorModel.secondNumber = nil
            }
            
            calculatorModel.operation = buttonText
            startNewNumber = true
            
        case "=":
            // get the result from the model
            if(calculatorModel.secondNumber == nil) {
                calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            }
            
            currentValue = String(calculatorModel.getResult())
            calculatorModel.reset()
            calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            startNewNumber = true

        
        case "C":
            currentValue = "0"
            calculatorModel.reset()
            startNewNumber = true
            
        default: //break
            print(buttonText)
        }
        
        numberDisplay.text = currentValue
    }
    
}

