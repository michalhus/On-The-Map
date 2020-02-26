//
//  AddLocationCompletionViewController.swift
//  On The Map
//
//  Created by Michal Hus on 2/23/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import UIKit

class AddLocationCompletionViewController: UIViewController {
   
    @IBAction func addLocation(_ sender: Any) {
        Client.addStudentLocation { (success: AddStudentLocationPOSTResponse?, error:Error?) in
//WIP
            //            print(success)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
