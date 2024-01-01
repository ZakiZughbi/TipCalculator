//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
//    var resultSender = ResultSender()
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var resultTo2DecimalPlaces = "0"


    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsNumber / 100
    }
    
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
//        self.splitNumberLabel.text = Int(sender.value).description
//        numberOfPeople = Int(splitNumberLabel.text!) ?? 2
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)

    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
//        let billNum = Double(billTextField.text ?? "0")
//        let totalTip = billNum! * tip
//        let totalBill = (billNum! + totalTip) / Double(numberOfPeople)
//        print(String(format: "%.2f", totalBill))
        
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (tip + 1) / Double(numberOfPeople)
            resultTo2DecimalPlaces = String(format: "%.2f", result)
        }
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = self.resultTo2DecimalPlaces
            destinationVC.splitSettings = numberOfPeople
            destinationVC.tipSettings = Int(tip * 100)
            
        }
    }
    
}

