//
//  mapview.swift
//  Restorani preko koda
//
//  Created by Jovana Jovovic on 9/3/18.
//  Copyright © 2018 Jovana Jovovic. All rights reserved.
//

import UIKit
import MapKit

class MapView: UIViewController {

    let topContainer : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    //mapa unutar top container
    
    let mapView: MKMapView = {
        let mv = MKMapView()
        return mv
    }()
    
    let middleContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    let restaurantName : UILabel = {
        let label = UILabel()
        label.text = "Restaurant Name"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    let categoryType : UILabel = {
        let label = UILabel()
        label.text = "Category Type"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
 
    let bottomContainer : UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .purple
        view.addSubview(topContainer)
        topContainer.addSubview(mapView)
        view.addSubview(middleContainer)
        middleContainer.addSubview(restaurantName)
        middleContainer.addSubview(categoryType)
        view.addSubview(bottomContainer)
        
        
        
        topContainer.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 280)
        
        mapView.anchor(topContainer.topAnchor, left: topContainer.leftAnchor, bottom: topContainer.bottomAnchor, right: topContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        middleContainer.anchor(topContainer.bottomAnchor, left: topContainer.leftAnchor, bottom: nil, right: topContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 100)
        
        restaurantName.anchor(middleContainer.topAnchor, left: middleContainer.leftAnchor, bottom: nil, right: middleContainer.rightAnchor, topConstant: 50, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        categoryType.anchor(restaurantName.topAnchor, left: middleContainer.leftAnchor, bottom: nil, right: middleContainer.rightAnchor, topConstant: 30, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        bottomContainer.anchor(middleContainer.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    
}


