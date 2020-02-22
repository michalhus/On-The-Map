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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTextField.text = "michal.hus@willowtreeapps.com"
        passwordTextField.text = "tousB3wgM4!"
    }

    @IBAction func authenticateUser(_ sender: Any) {
        Client.authenticationPOST(username: emailTextField.text!, password: passwordTextField.text!, completion: handleRequestSessionResponse(success: error:))
    }
    
    func handleRequestSessionResponse(success: Bool, error: Error?){
        if success {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "completeLogin", sender: nil)
            }
        }
    }
    
}

