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
                self.errorAlertMessage(title: "Fetching User Data Failed", message: error!.localizedDescription)
                return
            }
        }
        
        guard let location = location.text else {
            self.errorAlertMessage(title: "Location Failure", message: "Locatin was not provide!")
            return
        }
        
//IGNORE THIS WARRNING FOR NOW, LINK VAR WILL BE PASSED LATER ON TO THE POST API....
        guard let link = link.text else {
            self.errorAlertMessage(title: "Link Failure", message: "Link was not provide!")
            return
        }
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(location) { (placemark, error) in
            self.processResponse(withPlacemarks: placemark, error: error)
        }
    
    }
    
    func errorAlertMessage(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        show(alertVC, sender: nil)
    }
    
    //    func getCoordinate( addressString : String,
    //                              completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
    //        let geocoder = CLGeocoder()
    //        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
    //            if error == nil {
    //                if let placemark = placemarks?[0] {
    //                    let location = placemark.location!
    //
    //                    completionHandler(location.coordinate, nil)
    //                    return
    //                }
    //            }
    //
    //            completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
    //        }
    //    }
    
    
    
    
    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {

        guard let placemarks = placemarks, error == nil else {
            self.errorAlertMessage(title: "", message: error!.localizedDescription)
            return
        }
        
        var location: CLLocation?
        
        if placemarks.count > 0 {
            location = placemarks.first?.location
        }
        
        
//        if placemarks = placemarks?[0] {
//                                let location = placemark.location!
//                                return
//  }
        
        
        if let location = location {
                            let coordinate = location.coordinate
                            print(coordinate)
        }
        
    
        
//        else {
//
//                //                location.text =
//                print("No Matching Location Found")
//            }
//        }
    
    
    
        
        
        
    }
}
