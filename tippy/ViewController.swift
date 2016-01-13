//
//  ViewController.swift
//  tippy
//
//  Created by Maryum Styles on 1/11/16.
//  Copyright © 2016 Maryum Styles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!

    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    var selectedDefaultHome:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        tipSegmentedControl.selectedSegmentIndex = selectedDefaultHome
        billTextField.becomeFirstResponder()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18,0.2,0.22]
        let tipPercentage = tipPercentages[tipSegmentedControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billTextField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount+tip

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f",total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="showSettingsController" {
            _ = segue.destinationViewController as! SettingsViewController
        }
    }
}

