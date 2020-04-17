//
//  SignUpViewController.swift
//  iOS_SEA_LIFESTYLE
//
//  Created by Ayo  on 4/9/20.
//  Copyright © 2020 Ayo . All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signUp: UIButton!
    
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = firstName.text! + " " + lastName.text!
        user.password = password.text
//      user.email = "email@example.com"
        
        user.signUpInBackground { (success, error) in
            if success {
                self.firstName.text?.removeAll()
                self.lastName.text?.removeAll()
                self.emailAddress.text?.removeAll()
                self.password.text?.removeAll()
            } else {
                print("Error \(error?.localizedDescription)")
            }
        }
       

    }
    
    override func viewDidLoad() {
        
        signUp.layer.cornerRadius = 10
        signUp.layer.borderColor = UIColor.white.cgColor
        firstName.layer.cornerRadius = 10
        firstName.layer.borderWidth = 1.0
        firstName.layer.masksToBounds = true
        firstName.layer.borderColor = UIColor.white.cgColor
        firstName.borderStyle = UITextField.BorderStyle.roundedRect
        
        lastName.layer.cornerRadius = 10
        lastName.layer.borderWidth = 1.0
        lastName.layer.masksToBounds = true
        lastName.layer.borderColor = UIColor.white.cgColor
        lastName.borderStyle = UITextField.BorderStyle.roundedRect
        
        emailAddress.layer.cornerRadius = 10
        emailAddress.layer.borderWidth = 1.0
        emailAddress.layer.masksToBounds = true
        emailAddress.layer.borderColor = UIColor.white.cgColor
        emailAddress.borderStyle = UITextField.BorderStyle.roundedRect
        
        password.layer.cornerRadius = 10
        password.layer.borderWidth = 1.0
        password.layer.masksToBounds = true
        password.layer.borderColor = UIColor.white.cgColor
        password.borderStyle = UITextField.BorderStyle.roundedRect
        
        
    
        
      
        super.viewDidLoad()
        

       
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
