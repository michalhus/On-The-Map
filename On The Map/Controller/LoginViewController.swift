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
    
    @IBAction func signupViaSafari(_ sender: Any) {
        UIApplication.shared.open(Client.Endpoints.redirectSignUp.url, options: [:], completionHandler: nil)
    }
    
    func handleRequestSessionResponse(success: Bool, error: Error?){
        guard let error = error else {
            self.performSegue(withIdentifier: "completeLogin", sender: nil)
            return
        }
        showLoginFailure(message: error.localizedDescription )
    }
    
    func showLoginFailure(message: String) {
        let alertVC = UIAlertController(title: "Login Failed", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        show(alertVC, sender: nil)
    }
    
}

