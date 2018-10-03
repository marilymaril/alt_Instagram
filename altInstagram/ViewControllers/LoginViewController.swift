//
//  LoginViewController.swift
//  altInstagram
//
//  Created by Marilyn Florek on 9/26/18.
//  Copyright © 2018 Marilyn Florek. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var signUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        if (usernameField.text?.isEmpty)! || (passwordField.text?.isEmpty)!
        {
            let alertController = UIAlertController(title: "Sign in Error", message: "Username or password empty", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                print("Okay button tapped")
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true) {}
        }
        else
        {
            PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user:PFUser?, error:Error?) in
                if user != nil {
                    print("You're logged in!")
                    self.performSegue(withIdentifier: "homeSegue", sender: nil)
                }
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        
        if (usernameField.text?.isEmpty)! || (passwordField.text?.isEmpty)!
        {
            let alertController = UIAlertController(title: "Sign up Error", message: "Username or password empty", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                print("Okay button tapped")
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true) {}
            
        }
        else
        {
            let newUser = PFUser()
            
            newUser.username = usernameField.text
            newUser.password = passwordField.text
            
            newUser.signUpInBackground { (success: Bool, error: Error?) in
                if success
                {
                    print("New User!")
                    self.performSegue(withIdentifier: "homeSegue", sender: nil)
                }
                else
                {
                    print(error?.localizedDescription as Any)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
