//
//  AddLocationVC.swift
//  On The Map
//
//  Created by Michal Hus on 2/23/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController {
    
    @IBAction func cancelOut(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Client.exampleOfAGet()
    }
    
}
