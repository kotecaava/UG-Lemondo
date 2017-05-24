//
//  MainScreen.swift
//  Simple Calculator
//
//  Created by C0mrade on 5/24/17.
//  Copyright © 2017 C0mrade. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var lblMain: UILabel!
    
    // MARK: - Properties
    var isFirstDigit = true
    var calculatedNumOne = 0.0
    var arithmetic = 0
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        if !lblMain.text!.isEmpty {
            let number = getCalculatedValue(with: arithmetic, num1: calculatedNumOne, num2: Double(lblMain.text!)!)
            lblMain.text = "\(number)"
        } else {
            print("Could not make math operation because text is empty")
        }
    }
    
    @IBAction func clearAllTapped(_ sender: UIButton) {
        lblMain.text = "" // will clear label
    }
    
    @IBAction func arithmeticButtonTapped(_ sender: UIButton) {
        if !lblMain.text!.isEmpty {
            arithmetic = sender.tag // will store math operator
            calculatedNumOne = Double(lblMain.text!)! // cast string to double
            lblMain.text = ""
        } else {
            print("Could not select math operator because text is empty")
        }
    }
    
    @IBAction func calculatorNumberTapped(_ sender: UIButton) {
        // if user clicks on the button, first it will add number as main,
        // following numbers will be concatinated from right to left
        lblMain.text = isFirstDigit ? "\(sender.tag)" : lblMain.text! + "\(sender.tag)"
        isFirstDigit = false
    }
    
    fileprivate func getCalculatedValue (with op: Int, num1: Double, num2: Double) -> Double {
        switch op {
        case 0:
            return num1 + num2
        case 1:
            return num1 - num2
        case 2:
            return num1 / num2
        case 3:
            return num1 * num2
        default:
            break
        }
        return 0.0
    }
    
}
