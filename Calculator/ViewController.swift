//
//  ViewController.swift
//  Calculator
//
//  Created by John Anukem on 5/24/17.
//  Copyright © 2017 Columbia University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        let textCurrentlyInDisplay = display.text!
    
        if userIsInTheMiddleOfTyping {
            if(!display.text!.contains(".") || digit != "."){
                display.text = textCurrentlyInDisplay + digit
            }
        }
        else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
        print(brain.description)
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
        print(brain.description)
    }
}
