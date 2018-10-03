//
//  PostCell.swift
//  altInstagram
//
//  Created by Marilyn Florek on 9/30/18.
//  Copyright © 2018 Marilyn Florek. All rights reserved.
//

import UIKit
import Parse

class PostCell: UITableViewCell {
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var usernameField: UILabel!
    @IBOutlet weak var postCaption: UILabel!
    @IBOutlet weak var likesNumber: UILabel!
    @IBOutlet weak var topUserName: UILabel!
    @IBOutlet weak var userProfilePhoto: UIImageView!
    
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
                    self.likesNumber.text = String(post.likesCount)
                } else {
                    self.likesNumber.text = String(0)
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
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
