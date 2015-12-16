//
//  MainViewController.swift
//  Twitter
//
//  Created by Mattia on 15/12/2015.
//  Copyright © 2015 Mattia. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    var ref = Firebase(url: "https://twittermattia.firebaseio.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logout(sender: AnyObject) {
        
        ref.unauth()
        self.performSegueWithIdentifier("logoutSegue", sender: self)
    }
}
