//
//  DetailViewController.swift
//  altInstagram
//
//  Created by Marilyn Florek on 10/2/18.
//  Copyright © 2018 Marilyn Florek. All rights reserved.
//

import UIKit
import Parse

class DetailViewController: UIViewController {
    @IBOutlet weak var topUserName: UILabel!
    @IBOutlet weak var usernameField: UILabel!
    @IBOutlet weak var postCaption: UILabel!
    @IBOutlet weak var timestampField: UILabel!
    @IBOutlet weak var likesNumbr: UILabel!
    
    var post: InstagramPosts! {
        didSet {
            if post != nil {
                if post.author.username != nil {
                    self.topUserName.text = post.author.username
                    self.usernameField.text = post.author.username
                } else {
                    self.topUserName.text = "🤖"
                    self.usernameField.text = "🤖"
                }
                
                if post.caption != "" {
                    self.postCaption.text = post.caption as String!
                } else {
                    self.postCaption.text = ""
                }
                
                if post.likesCount != 0 {
                    self.likesNumbr.text = String(post.likesCount)
                } else {
                    self.likesNumbr.text = String(0)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
