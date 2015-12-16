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
    
    
    
    
    
    var posts: [String] = ["ciao", "Julien"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")!
        cell.textLabel!.text = self.posts[indexPath.row]
        return cell
    }
    
    
    
    
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logout(sender: AnyObject) {
        
        ref.unauth()
        self.performSegueWithIdentifier("logoutSegue", sender: self)
    }
}
