//
//  ViewController.swift
//  SAAAAA
//
//  Created by Peter Alserda on 04/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import UIKit

class LogbookViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(__FUNCTION__)
//        tableView.backgroundColor = UIColor.redColor()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func styleView() {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath) as UITableViewCell
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }

}

