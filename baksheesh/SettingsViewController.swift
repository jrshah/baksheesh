//
//  SettingsViewController.swift
//  baksheesh
//
//  Created by Jay Shah on 9/6/15.
//  Copyright (c) 2015 Jay Shah. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSlider: UISlider!
    @IBOutlet weak var defaultTipValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.objectForKey("defaultTip") != nil) {
            var defaultValue = defaults.floatForKey("defaultTip")
            defaultTipSlider.value = defaultValue
            defaultTipValueLabel.text = "\(defaultValue)"+"%"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func defaultTipValueChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTip = round(defaultTipSlider.value)
        defaults.setFloat(defaultTip, forKey: "defaultTip")
        defaultTipValueLabel.text = "\(defaultTip)"+"%"
        
    }
    @IBAction func viewDefaultTipSlider(sender: AnyObject) {
        println("hello")
    }

}
