//
//  SettingsViewController.swift
//  tips
//
//  Created by Lê Quang Bửu on 11/7/15.
//  Copyright © 2015 Lê Quang Bửu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func handleBackButtonTap(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func handleTap(sender: AnyObject) {
        view.endEditing(true)
    }
}
