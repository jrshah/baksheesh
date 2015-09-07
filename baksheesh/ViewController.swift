//
//  ViewController.swift
//  baksheesh
//
//  Created by Jay Shah on 9/6/15.
//  Copyright (c) 2015 Jay Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //UI labels
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    //Text Field
    @IBOutlet weak var amountField: UITextField!
    
    //Slider
    @IBOutlet weak var tipSliderValueLabel: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        amountField.becomeFirstResponder()
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.objectForKey("defaultTip") != nil) {
            var defaultValue = defaults.floatForKey("defaultTip")
            tipSliderValueLabel.value = defaultValue
            tipAmountLabel.text = "$0.00 ("+"\(defaultValue)"+"%)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func editChangedBill(sender: AnyObject) {
        var tipSliderValue = round(tipSliderValueLabel.value)


        var tipPercentage = Double (tipSliderValue / 100)
        
        var billAmount = NSString(string: amountField.text).doubleValue
        var tip = billAmount * tipPercentage
        var totalAmount = billAmount + tip
        
        tipAmountLabel.text = String(format: "$%.2f (%.f", tip, tipSliderValue)+"%)"
        totalAmountLabel.text = String(format: "$%.2f", totalAmount)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

