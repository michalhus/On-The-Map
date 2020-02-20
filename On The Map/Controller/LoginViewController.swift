//
//  LoginViewController.swift
//  On The Map
//
//  Created by Michal Hus on 2/20/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UITextView!
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTextField.text = ""
        passwordTextField.text = ""
    }

    @IBAction func authenticateUser(_ sender: Any) {
        print(emailTextField.text ?? "" )
        print(passwordTextField.text ?? "")
    }
    
}

