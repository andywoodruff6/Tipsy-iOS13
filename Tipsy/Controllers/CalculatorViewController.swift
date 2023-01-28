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
    var tipPct: Float?
    
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
        
        var title: String = sender.currentTitle!
        var trimmedTitle = title.dropLast(1)
        var trimmedTitleToNumber: Float = Float(trimmedTitle) ?? 0.0
        var convertToPct = (trimmedTitleToNumber / 100)
        tipPct = convertToPct
//        print(convertToPct)
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        numberOfPartyMembers = Float(sender.value)
        billTextField.endEditing(true)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(numberOfPartyMembers)
        let billValue = Float(billTextField.text ?? "0.0")
        let totalBill = (billValue! * tipPct!) + billValue!
        
        let billShare = totalBill / numberOfPartyMembers
        print(billShare)
    }
}

