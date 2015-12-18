//
//  ViewController.swift
//  CQTextField
//
//  Created by chenchangqing on 12/17/2015.
//  Copyright (c) 2015 chenchangqing. All rights reserved.
//

import UIKit
import CQTextField

class ViewController: UIViewController {
    
    @IBOutlet weak var countdownButton: SwiftCountdownButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapCountdownClick(sender: AnyObject) {
        countdownButton.maxSecond = 30
        countdownButton.countdown = true
    }

}

