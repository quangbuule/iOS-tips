//
//  ViewController.swift
//  tips
//
//  Created by Lê Quang Bửu on 11/7/15.
//  Copyright © 2015 Lê Quang Bửu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var percentSegmentedControl: UISegmentedControl!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    
    var userDefaults: NSUserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // let userDefaults = NSUserDefaults.standardUserDefaults()
        
        userDefaults = NSUserDefaults.standardUserDefaults()
        
        userDefaults.registerDefaults([
            "tip%-default": 20 as Int,
            "tip%-minimum": 18 as Int,
            "tip%-maximum": 22 as Int
        ])
        
        userDefaults.synchronize()
        
        billTextField.text = ""
        tipLabel.text = "+ $0.00"
        
        percentSegmentedControl.selectedSegmentIndex = 1
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        percentSegmentedControl.setTitle(String(format: "%d%%", userDefaults.integerForKey("tip%-minimum")), forSegmentAtIndex: 0)
        percentSegmentedControl.setTitle(String(format: "%d%%", userDefaults.integerForKey("tip%-default")), forSegmentAtIndex: 1)
        percentSegmentedControl.setTitle(String(format: "%d%%", userDefaults.integerForKey("tip%-maximum")), forSegmentAtIndex: 2)
        
        billTextField.becomeFirstResponder()
        handleInputsChange()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getPercentage() -> Int {
        switch percentSegmentedControl.selectedSegmentIndex {
        case 0:
            return userDefaults.integerForKey("tip%-minimum")
            
        case 2:
            return userDefaults.integerForKey("tip%-maximum")
            
        default:
            return userDefaults.integerForKey("tip%-default")
        }
    }
    
    func handleInputsChange() {
        let billAmount = (billTextField.text! as NSString).floatValue
        let tipAmount = billAmount * Float(getPercentage()) / 100
        let totalAmount = billAmount + tipAmount
        
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        handleInputsChange()
    }
    
    @IBAction func onPercentageChanged(sender: AnyObject) {
        handleInputsChange()
    }
    
    @IBAction func opTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

