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
        
        allMapView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right:view.rightAnchor , topConstant: 0, leftConstant: 0  , bottomConstant: 0, rightConstant: 0 , widthConstant: 0, heightConstant: 0)
    }
}
