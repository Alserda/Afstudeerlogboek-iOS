//
//  ViewController.swift
//  SAAAAA
//
//  Created by Peter Alserda on 04/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift

class LogbookViewController: UITableViewController {
    let backendConnection = BackendConnection.sharedInstance
    let storageManager = StorageManager.sharedInstance
    let posts = try! Realm().objects(Post).sorted("date", ascending: false)
//    let refresh: UIRefreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl?.addTarget(self, action: "refresh:", forControlEvents: .ValueChanged)
        fetchLogposts()

    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    func fetchLogposts() {
        backendConnection.fetchLogposts({ (response) -> () in
            self.handleRetrievedPosts(response)
            }) { (error) -> () in
                // Show some kind of error to the user
                print(error)
        }
    }
    
    func refresh(sender: AnyObject) {
        print(__FUNCTION__)
        storageManager.clearPosts { (success) -> () in
            if success {
                print("Everything removed")
                self.tableView.reloadData()
                self.fetchLogposts()
            }
        }
    }

    func handleRetrievedPosts(postsJSON: JSON) {
        storageManager.storePosts(with: postsJSON) { (success) -> () in
            if success {
                print(self.posts)
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (posts.count != 0) {
            return posts.count
        }
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath) as UITableViewCell
        
        if let circle = cell.viewWithTag(1) as! UIImageView! {
            circle.tintColor = UIColor(hexString: post.color)
        }
        
        if let date = cell.viewWithTag(2) as! UILabel! {
            date.text = NSDate().formatDateToDayMonthYear(String().formatDate(post.date))
        }
        
        if let name = cell.viewWithTag(3) as! UILabel! {
            name.text = post.author
        }
        
        if let body = cell.viewWithTag(4) as! UILabel! {
            body.text = post.body
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
        case "toDetail":
            let path = self.tableView.indexPathsForSelectedRows![0]
            let logDetail = segue.destinationViewController as! LogDetail
            logDetail.post = self.posts[path.row]
        default:
            break
        }
    }
}

