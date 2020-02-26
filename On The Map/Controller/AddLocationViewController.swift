//
//  AddLocationVC.swift
//  On The Map
//
//  Created by Michal Hus on 2/23/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class AddLocationViewController: UIViewController {
    
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var link: UITextField!
    
    @IBAction func cancelOut(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addLocation(_ sender: Any) {
        Client.getUserPublicInfo { (success, error) in
            guard success, error == nil else {
                self.errorAlertMessage(title: "Fetching User Data Failure", message: error!.localizedDescription)
                return
            }
        }
        
        guard let location = location.text, location != ""  else {
            errorAlertMessage(title: "Location Failure", message: "Please enter a locatin.")
            return
        }
        
        guard let link = link.text, link != "" else {
            errorAlertMessage(title: "Link Failure", message: "Please enter a link.")
            return
        }
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(location) { (placemark, error) in
            self.processResponse(withPlacemarks: placemark, error: error)
        }
    
    }
    
    func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {

        guard let placemarks = placemarks, error == nil else {
            errorAlertMessage(title: "Location Entry Failure", message: "Provided location could not be found.")
            return
        }
        
        if placemarks.count > 0 {
            guard let location = placemarks.first?.location, error == nil else {
                errorAlertMessage(title: "Failure", message: error!.localizedDescription)
                return
            }
            let coordinate = location.coordinate
            print(coordinate)
        }
    }

}
