//
//  LoanViewController.swift
//  LoanCalculator
//
//  Created by Emily Chin on 9/30/17.
//  Copyright © 2017 Emily Chin. All rights reserved.
//

import Foundation
import UIKit

class LoanViewController: UIViewController {
    override func viewDidLoad() {
        monthlyPaymentTextField.keyboardType = UIKeyboardType.numberPad
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
        monthlyPaymentTextField.inputAccessoryView = toolbar
        termTextField.inputAccessoryView = toolbar
        rateField.inputAccessoryView = toolbar
    }
    
    func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var monthlyPaymentTextField: UITextField!
    @IBOutlet weak var termTextField: UITextField!
    @IBOutlet weak var rateField: UITextField!
    
    @IBOutlet weak var loanAmountLabel: UILabel!
    @IBOutlet weak var totalInterestLabel: UILabel!
    @IBOutlet weak var totalPaymentLabel: UILabel!
    
    @IBAction func calculateButton(_ sender: Any) {
        if let monthlyPayment = Double(monthlyPaymentTextField.text!) {
            if let term = Double(termTextField.text!) {
                if let rate = Double(rateField.text!) {
                    let numerator = monthlyPayment * (1.0 - (pow((1.0 + rate/1200),(0.0 - term*12))))
                    let denominator = rate/1200
                    let loanAmount = numerator / denominator
                    let totalPayment = monthlyPayment * term * 12
                    let totalInterest = totalPayment - loanAmount
                    loanAmountLabel.text = "$\(String(format: "%.2f", loanAmount))"
                    totalPaymentLabel.text = "$\(String(format: "%.2f", totalPayment))"
                    totalInterestLabel.text = "$\(String(format: "%.2f", totalInterest))"
                } else {
                    loanAmountLabel.text = ""
                    totalPaymentLabel.text = ""
                    totalInterestLabel.text = ""
                }
            } else {
                loanAmountLabel.text = ""
                totalPaymentLabel.text = ""
                totalInterestLabel.text = ""
            }
        } else {
            loanAmountLabel.text = ""
            totalPaymentLabel.text = ""
            totalInterestLabel.text = ""
        }
    }
    
    
}
