//
//  BigMap.swift
//  Restorani preko koda
//
//  Created by Jovana Jovovic on 9/4/18.
//  Copyright © 2018 Jovana Jovovic. All rights reserved.
//

import UIKit
import MapKit

final class AllRestarantsController: UIViewController, MKMapViewDelegate  {
    
   private let allMapView : MKMapView = {
        let mv = MKMapView()
        return mv
    }()
    
    var restaurants: [Restaurants]?
    var an = [MKPointAnnotation]()
    
    
    let regionRadius : CLLocationDistance = 10000000
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
         allMapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(allMapView)
        
        allMapView.delegate = self
        setupMap()
        allMapView.addAnnotations(an)
       
        allMapView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right:view.rightAnchor , topConstant: 0, leftConstant: 0  , bottomConstant: 0, rightConstant: 0 , widthConstant: 0, heightConstant: 0)
    }
    
    func setupMap() {
        if let arrayOfRestaurants = restaurants {
            for rest in arrayOfRestaurants {
                if let lat = rest.location?.lat, let lang = rest.location?.lng {
                    let cordinates : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: lang)
                    
                    let region : MKCoordinateRegion =
                    allMapView.regionThatFits(MKCoordinateRegionMakeWithDistance(cordinates, 500000, 500000))
                    allMapView.setRegion(region, animated: true)
                    
                    let point = MKPointAnnotation()
                    point.coordinate = cordinates
                    point.title = rest.name
                    point.subtitle = rest.category
                    an.append(point)
                }
            }
        }
    }
}
