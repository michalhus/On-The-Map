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

class AddLocationCompletionViewController: UIViewController, MKMapViewDelegate {
   
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    var link:String = ""
    var mapString: String = ""

    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func addLocation(_ sender: Any) {
        Client.addStudentLocation(mapString: mapString, mediaURL: link, latitude: coordinate.latitude, longitude: coordinate.longitude) { (success: Bool, error:String?) in
            guard success, error == nil else {
                self.errorAlertMessage(title: "", message: error!)
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        self.pinLocatinDisplay()
    }
    
    func pinLocatinDisplay() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "\(mapString)"
        self.mapView.addAnnotation(annotation)
    }
    
    // MARK: - MKMapViewDelegate
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard annotation is MKPointAnnotation else { return nil }
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = .red
        }
        else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    
}
