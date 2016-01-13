//
//  SettingsViewController.swift
//  tippy
//
//  Created by Maryum Styles on 1/13/16.
//  Copyright © 2016 Maryum Styles. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var homeButton: UIButton!
    var selectedDefault:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func valueChanged(sender: AnyObject) {
        selectedDefault = defaultTipControl.selectedSegmentIndex
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showHomeController" {
            let homeViewController = segue.destinationViewController as! ViewController
            homeViewController.selectedDefaultHome = selectedDefault
        }
    }

}
