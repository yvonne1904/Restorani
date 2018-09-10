//
//  BigMap.swift
//  Restorani preko koda
//
//  Created by Jovana Jovovic on 9/4/18.
//  Copyright © 2018 Jovana Jovovic. All rights reserved.
//

import UIKit
import MapKit

class AllRestarantsController: UIViewController, MKMapViewDelegate  {
    
    let allMapView : MKMapView = {
        let mv = MKMapView()
        
        
        return mv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(allMapView)
        
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(34.096924 , 118.249216)
        let region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        allMapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "PIN"
        annotation.subtitle = "Come visit me here!"
        allMapView.addAnnotation(annotation)
       
        
        
        allMapView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right:view.rightAnchor , topConstant: 0, leftConstant: 0  , bottomConstant: 0, rightConstant: 0 , widthConstant: 0, heightConstant: 0)
    }
}
