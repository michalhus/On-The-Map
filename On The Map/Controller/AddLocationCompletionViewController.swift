//
//  AddLocationCompletionViewController.swift
//  On The Map
//
//  Created by Michal Hus on 2/23/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class AddLocationCompletionViewController: UIViewController {
   
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    var link:String = ""
    var mapString: String = ""

    @IBAction func addLocation(_ sender: Any) {
        Client.addStudentLocation(mapString: mapString, mediaURL: link, latitude: coordinate.latitude, longitude: coordinate.longitude) { (success: Bool, error:Error?) in
            guard success, error == nil else {
                self.errorAlertMessage(title: "", message: (error?.localizedDescription)!)
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
