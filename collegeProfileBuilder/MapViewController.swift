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
        
        let address1 = "Cal Poly Pomona"
        geoCoder1.geocodeAddressString(address1) { (arrayOfPlacemarks1, error1) -> Void in
            for place in arrayOfPlacemarks1!
            {
                let annotation = MKPointAnnotation()
                annotation.coordinate = (place.location?.coordinate)!
                annotation.title = place.name
                self.myMapView.addAnnotation(annotation)
            }
        }
        
        
        
        

    }


   
}
