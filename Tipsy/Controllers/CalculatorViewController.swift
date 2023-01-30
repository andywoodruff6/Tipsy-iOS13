//
//  ViewController.swift
//  Tipsy
//
//  Created by Andy W. on 01/28/2023.
//  Copyright © 2023 The New Badger. All rights reserved.
//
//  This works but is not error safe at all.

import UIKit

class CalculatorViewController: UIViewController {
    
    var numberOfPartyMembers: Float = 0
    var tipPct: Float = 0
    var billValue: Float = 0
    var totalBill: Float = 0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let title: String = sender.currentTitle!
        let trimmedTitle = title.dropLast(1)
        let trimmedTitleToNumber: Float = Float(trimmedTitle) ?? 0.0
        let convertToPct = (trimmedTitleToNumber / 100)
        tipPct = convertToPct
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        numberOfPartyMembers = Float(sender.value)
        billTextField.endEditing(true)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text != nil {
            billValue = Float(billTextField.text!) ?? 0.0
        }
        totalBill = (billValue * tipPct) + billValue
        
        let billShare = totalBill / numberOfPartyMembers
        print(billShare)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.billTotalLabel = String(totalBill)
            destinationVC.numGuestsLabel = String(numberOfPartyMembers)
            destinationVC.tipPctLabel = String(tipPct)
        }
    }
}

