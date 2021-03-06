//
//  LoginViewController.swift
//  On The Map
//
//  Created by Michal Hus on 2/20/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var students:[Student] = []
    let loginErrorTitle:String = "Log In Failure"
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func authenticateUser(_ sender: Any) {
        Client.authenticationPOST(username: emailTextField.text!, password: passwordTextField.text!, completion: handleRequestSessionResponse(success: error:))
    }
    
    @IBAction func signupViaSafari(_ sender: Any) {
        UIApplication.shared.open(Client.Endpoints.redirectSignUp.url, options: [:], completionHandler: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "completeLogin" else {
            return
        }
        
        guard let destination = segue.destination as? UITabBarController else {
            return
        }
        
        guard let viewControllers = destination.viewControllers else {
            return
        }
        
        let mapNavigationController = viewControllers[0] as! UINavigationController
        let mapController = mapNavigationController.viewControllers.first! as! MapKitViewController
        
        let tableNavigationController = viewControllers[1] as! UINavigationController
        let tableViewController = tableNavigationController.viewControllers.first! as! StudentsLocationTableViewController
        
        mapController.students = students
        tableViewController.students = students
        
    }
    
    func handleRequestSessionResponse(success: Bool, error: String?){
        guard success, error == nil else {
            errorAlertMessage(title: loginErrorTitle, message: error!)
            return
        }
        Client.getStudentsLocation(completion: handleGETStudentsLocationRequest(response: error:))
    }
    
    func handleGETStudentsLocationRequest(response: StudentsLocationResponse?, error: String?){
        guard let response = response, error == nil else {
            errorAlertMessage(title: loginErrorTitle, message: error!)
            return
        }
        
        self.students = response.results
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "completeLogin", sender: nil)
        }
    }
    
}

