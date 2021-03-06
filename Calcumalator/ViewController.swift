//
//  ViewController.swift
//  Calcumalator
//
//  Created by Jesse Baril on 2017-01-18.
//  Copyright © 2017 Jesse Baril. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var firstNumberText = ""
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //Handles button ALL button taps/presses and includes some error handling
    @IBAction func handleButtonPress(_ sender: UIButton) {
        if canClear {
            resultLabel.text = ""
            canClear = false
        }
        let currentText = resultLabel.text!
        let textLabel = sender.titleLabel?.text
        if let text = textLabel {
            switch text {
            case "+", "*", "/", "-":
                if hasOp {
                    return
                }
                op = text
                isFirstNumber = false
                hasOp = true
                resultLabel.text = "\(currentText) \(op) "
                break
            case "=":
                if resultLabel.text == "" {
                    resultLabel.text = ""
                }
                else{
                    isFirstNumber = true
                    hasOp = false
                    canClear = true
                    let result = calculate()
                    resultLabel.text = "\(result)"
                }
                break
            case "AC":
                isFirstNumber = true
                hasOp = false
                canClear = true
                resultLabel.text = "0"
                break
            case "C":
                isFirstNumber = true
                hasOp = false
                canClear = true
                resultLabel.text = "0"
                break
            default:
                if isFirstNumber {
                    firstNumberText = "\(firstNumberText)\(text)"
                } else {
                    secondNumberText = "\(secondNumberText)\(text)"
                }
                resultLabel.text = "\(currentText)\(text)"
                break;
            }
        }
    }
    
    // Main function of math calculations
    func calculate() -> Double {
        let firstNumber = Double(firstNumberText)!
        let secondNumber = Double(secondNumberText)!
        firstNumberText = ""
        secondNumberText = ""
        switch op {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            return firstNumber / secondNumber
        default:
            return 0
        }


}
}
