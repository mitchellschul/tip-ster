//
//  ViewController.swift
//  tip
//
//  Created by Mitchell Schuldinger on 9/5/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitControl: UISegmentedControl!
    @IBOutlet weak var totalSplitLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.keyboardType = UIKeyboardType.decimalPad
        // Do any additional setup after loading the view.
        self.title = "Tipster"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          billAmountTextField.becomeFirstResponder()
      }

    @IBAction func onTap(_ sender: Any) {
        
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        //Get initial bill, get split ammount and calculate tip
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.20, 0.18, 0.15]
        let splitAmount = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
        
        //Calculate tip, split and total bill
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let split = total/splitAmount[splitControl.selectedSegmentIndex]
        
        
        //Update the tip, split and total labels
        tipPercentLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalSplitLabel.text = String(format: "$%.2f", split)
    }
    
    
}

