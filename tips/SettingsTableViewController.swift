//
//  SettingsTableViewController.swift
//  tips
//
//  Created by Lê Quang Bửu on 11/7/15.
//  Copyright © 2015 Lê Quang Bửu. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    @IBOutlet var defaultTextField: UITextField!
    @IBOutlet var minimumTextField: UITextField!
    @IBOutlet var maximumTextField: UITextField!
    var userDefaults: NSUserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaults = NSUserDefaults.standardUserDefaults()
        
        minimumTextField.text = String(format: "%d", userDefaults.integerForKey("tip%-minimum"))
        defaultTextField.text = String(format: "%d", userDefaults.integerForKey("tip%-default"))
        maximumTextField.text = String(format: "%d", userDefaults.integerForKey("tip%-maximum"))
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        userDefaults.setValue((minimumTextField.text! as NSString).integerValue, forKey: "tip%-minimum")
        userDefaults.setValue((defaultTextField.text! as NSString).integerValue, forKey: "tip%-default")
        userDefaults.setValue((maximumTextField.text! as NSString).integerValue, forKey: "tip%-maximum")
        userDefaults.synchronize()
    }
}
