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
    @IBOutlet weak var monthlyPaymentTextField: UITextField!
    @IBOutlet weak var termTextField: UITextField!
    @IBOutlet weak var rateField: UITextField!
    
    @IBOutlet weak var monthlyPaymentLabel: UILabel!
    
    @IBAction func calculateButton(_ sender: Any) {
        if let monthlyPayment = Double(monthlyPaymentTextField.text!) {
            if let term = Double(termTextField.text!) {
                if let rate = Double(rateField.text!) {
                    let numerator = monthlyPayment * (1.0 - (pow((1.0 + rate/1200),(0.0 - term*12))))
                    let denominator = rate/1200
                    let answer = numerator / denominator
                    // monthlyPaymentLabel.text = "\(answer)"
                    monthlyPaymentLabel.text = String(format: "%.2f", answer)
                    print("\(answer)")
                } else {
                    monthlyPaymentLabel.text = ""
                }
            } else {
                monthlyPaymentLabel.text = ""
            }
        } else {
            monthlyPaymentLabel.text = ""
        }
    }
    
    
}
