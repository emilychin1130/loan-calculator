//
//  MonthViewController.swift
//  LoanCalculator
//
//  Created by Emily Chin on 9/30/17.
//  Copyright © 2017 Emily Chin. All rights reserved.
//

import Foundation
import UIKit

class MonthViewController: UIViewController {
    override func viewDidLoad() {
        loanAmountTextField.keyboardType = UIKeyboardType.decimalPad
        termTextField.keyboardType = UIKeyboardType.numberPad
        rateField.keyboardType = UIKeyboardType.numberPad
        
        //init toolbar
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        //create left side empty space so that done button set on right side
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: Selector("doneButtonAction"))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        //setting toolbar as inputAccessoryView
        loanAmountTextField.inputAccessoryView = toolbar
        termTextField.inputAccessoryView = toolbar
        rateField.inputAccessoryView = toolbar
    }
    
    func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var loanAmountTextField: UITextField!
    @IBOutlet weak var termTextField: UITextField!
    @IBOutlet weak var rateField: UITextField!
        
    @IBOutlet weak var monthlyPaymentLabel: UILabel!
    @IBOutlet weak var totalInterestLabel: UILabel!

    @IBOutlet weak var totalPaymentLabel: UILabel!
    
    @IBAction func calculateButton(_ sender: Any) {
        if let loanAmount = Double(loanAmountTextField.text!) {
            if let term = Double(termTextField.text!) {
                if let rate = Double(rateField.text!) {
                    let numerator = ((rate/1200.0) * loanAmount)
                    let denominator = 1.0 - (pow((1.0 + rate/1200),(0.0 - term*12)))
                    let monthlyPayment = numerator / denominator
                    let totalPayment = monthlyPayment * term * 12
                    let totalInterest = totalPayment - loanAmount
                    monthlyPaymentLabel.text = "$\(String(format: "%.2f", monthlyPayment))"
                    totalInterestLabel.text = "$\(String(format: "%.2f", totalInterest))"
                    totalPaymentLabel.text = "$\(String(format: "%.2f", totalPayment))"
                } else {
                    monthlyPaymentLabel.text = ""
                    totalInterestLabel.text = ""
                    totalPaymentLabel.text = ""
                }
            } else {
                monthlyPaymentLabel.text = ""
                totalInterestLabel.text = ""
                totalPaymentLabel.text = ""
            }
        } else {
            monthlyPaymentLabel.text = ""
            totalInterestLabel.text = ""
            totalPaymentLabel.text = ""
        }
    }

    
}
