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
    @IBOutlet weak var postImage: UIImageView!
    
    var post: InstagramPosts!

    override func viewDidLoad() {
        super.viewDidLoad()

        setPost()
        // Do any additional setup after loading the view.
    }
    
    func setPost() {
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
            
            if (post.object(forKey: "media") as? PFFile) != nil {
                post.media.getDataInBackground({ (imageData: Data?, error: Error?) -> Void in
                    let image = UIImage(data: imageData!)
                    if image != nil {
                        self.postImage.image = image
                    }
                })
            } else {
                self.postImage.image = UIImage(named: "image_placeholder")
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
