//
//  MapViewController.swift
//  collegeProfileBuilder
//
//  Created by student1 on 4/18/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    var collegeInMapViewController = College()
    var locationManager = CLLocationManager()
    var geoCoder1 = CLGeocoder()
    var geoCoder2 = CLGeocoder()
    var geoCoder3 = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMapView.delegate = self
        print(collegeInMapViewController.name)
        let address = collegeInMapViewController.name
        
        print(address)
        
        geoCoder1.geocodeAddressString(address) { (arrayOfPlacemarks, error) -> Void in
            for place in arrayOfPlacemarks!
            {
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = (place.location?.coordinate)!
                annotation.title = place.name
                self.myMapView.addAnnotation(annotation)
            }
        }
        
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let pin = MKAnnotationView(annotation: annotation, reuseIdentifier:  nil)
        pin.image = UIImage(named: "collegePin")
        pin.canShowCallout = true
        let button = UIButton(type: .DetailDisclosure)
        pin.rightCalloutAccessoryView = button
        return pin
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
        let center = view.annotation!.coordinate
        let region = MKCoordinateRegion(center: center, span: coordinateSpan)
        myMapView.setRegion(region, animated: true)
    }
    
    
    
    
    @IBAction func dismissOnTap(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
