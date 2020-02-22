//
//  UIViewController+Extension.swift
//  On The Map
//
//  Created by Michal Hus on 2/21/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import UIKit

extension UIViewController {
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        Client.authenticationDELETE {_,_ in 
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
