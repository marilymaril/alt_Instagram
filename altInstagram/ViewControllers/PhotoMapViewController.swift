//
//  PhotoMapViewController.swift
//  altInstagram
//
//  Created by Marilyn Florek on 10/2/18.
//  Copyright © 2018 Marilyn Florek. All rights reserved.
//

import UIKit
import Parse

class PhotoMapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postCaptionField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        if editedImage.size.width != 0 {
            postImage.image = editedImage
        } else {
            postImage.image = originalImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onCancel(_ sender: Any) {
        self.performSegue(withIdentifier: "cancelSegue", sender: nil)
    }

    @IBAction func onShare(_ sender: Any) {
        self.performSegue(withIdentifier: "shareSegue", sender: nil)
    }
    
    @IBAction func onSubmit(_ sender: Any) {
//        var instagramPost = InstagramPosts()
//        instagramPost.caption = postCaptionField.text ?? ""
        InstagramPosts.postUserImage(image: postImage.image, withCaption: postCaptionField.text, withCompletion: { (success, error) in
            if success {
                print("The post was saved!")
                self.performSegue(withIdentifier: "shareSegue", sender: nil)
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        })
//        instagramPost.media = InstagramPosts.getPFFileFromImage(image: postImage.image)!
//        instagramPost.likesCount = 0
//        instagramPost.author = PFUser.current()!
//        instagramPost.saveInBackground { (success, error) in
//            if success {
//                print("The post was saved!")
//                self.performSegue(withIdentifier: "shareSegue", sender: nil)
//            } else if let error = error {
//                print("Problem saving message: \(error.localizedDescription)")
//            }
//        }
        
    }
    

}
