//
//  HomeViewController.swift
//  altInstagram
//
//  Created by Marilyn Florek on 9/30/18.
//  Copyright © 2018 Marilyn Florek. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [InstagramPosts]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        getPosts()
        
        Timer.scheduledTimer(timeInterval: 50, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
    }
    
    func getPosts(){
        let query = InstagramPosts.query()
        query!.includeKey("media")
        query!.includeKey("author")
        query!.includeKey("caption")
        query!.includeKey("likesCount")
        query!.includeKey("createdAt")
        query!.addDescendingOrder("createdAt")
        query!.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let objects = objects {
                print("Successfully retrieved \(objects.count) posts.")
                self.posts = objects as! [InstagramPosts]
                if self.posts != nil && self.posts.count != 0 {
                    print("Posts aren't null or 0")
                    self.tableView.reloadData()
                }
            } else {
                print(error?.localizedDescription as String!)
            }
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let indexPath = tableView.indexPathForSelectedRow
//        let detailViewController = segue.destination as! DetailViewController
//
//        let post = posts[(indexPath?.row)!]
//        detailViewController.post = post
//    }
    
    @IBAction func onLogout(_ sender: Any) {
        self.performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if posts != nil && posts.count != 0 {
            return posts.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        
        cell.post = posts[indexPath.row]
        
        return cell
    }
    
    @objc func onTimer() {
        // Add code to be run periodically
        getPosts()
    }
}
