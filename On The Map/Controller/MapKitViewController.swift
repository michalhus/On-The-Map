//
//  x.swift
//  On The Map
//
//  Created by Michal Hus on 2/25/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController, MKMapViewDelegate {
    
    var students:[Student] = []

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self

        var annotations = [MKPointAnnotation]()
        
        for student in self.students {
            // Notice that the float values are being used to create CLLocationDegree values.
            // This is a version of the Double type.
            let lat = CLLocationDegrees(student.latitude)
            let long = CLLocationDegrees(student.longitude)
            
            // The lat and long are used to create a CLLocationCoordinates2D instance.
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            
            // Here we create the annotation and set its coordiate, title, and subtitle properties
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "\(student.firstName) \(student.lastName)"
            annotation.subtitle = student.mediaURL
            
            // Finally we place the annotation in an array of annotations.
            annotations.append(annotation)
        }
        
        // When the array is complete, we add the annotations to the map.
        self.mapView.addAnnotations(annotations)
    }
        
//        self.pinLocatinDisplay()
//    }
   
    // MARK: - MKMapViewDelegate
    
    // Here we create a view with a "right callout accessory view". You might choose to look into other
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard annotation is MKPointAnnotation else { return nil }

        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = .red
            pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            if let toOpen = view.annotation?.subtitle! {
                UIApplication.shared.open(URL(string: toOpen)!, options: [:], completionHandler: nil)
            }
        }
    }
    
//    func pinLocatinDisplay() {
//        var annotations = [MKPointAnnotation]()
//
//        for student in self.students {
//                // Notice that the float values are being used to create CLLocationDegree values.
//                // This is a version of the Double type.
//                let lat = CLLocationDegrees(student.latitude)
//                let long = CLLocationDegrees(student.longitude)
//
//                // The lat and long are used to create a CLLocationCoordinates2D instance.
//                let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
//
//                // Here we create the annotation and set its coordiate, title, and subtitle properties
//                let annotation = MKPointAnnotation()
//                annotation.coordinate = coordinate
//                annotation.title = "\(student.firstName) \(student.lastName)"
//                annotation.subtitle = student.mediaURL
//
//                // Finally we place the annotation in an array of annotations.
//                annotations.append(annotation)
//            }
//
//            // When the array is complete, we add the annotations to the map.
//            self.mapView.addAnnotations(annotations)
//    }
}
