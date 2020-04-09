//
//  LoginViewController.swift
//  iOS_SEA_LIFESTYLE
//
//  Created by Ayo  on 4/9/20.
//  Copyright © 2020 Ayo . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var roundedCornerButton: UIButton!
    override func viewDidLoad() {
        roundedCornerButton.layer.cornerRadius = 10
        roundedCornerButton.layer.borderColor = UIColor.white.cgColor
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderWidth = 1.0
        emailTextField.layer.masksToBounds = true
        passwordTextField.layer.masksToBounds = true
        passwordTextField!.layer.borderColor = UIColor.white.cgColor
        emailTextField!.layer.borderColor = UIColor.white.cgColor
        emailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect

        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
