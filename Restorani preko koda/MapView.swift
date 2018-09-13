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
    
    // 1) Prvo pravimo promenljivu tipa Restoran tj onog tipa iz koga treba da dobijemo podatke
    var restaraurant: Restaurants? {
        didSet {
            if let name = restaraurant?.name {
                restaurantName.text = name
            }

            if let category = restaraurant?.category {
                categoryType.text = category
            }

            if let phone = restaraurant?.contact?.phone {
                phoneNumber.text = phone
            }
            if let adress = restaraurant?.location?.address {
                adressLabel.text = adress
            }
            if let twitter = restaraurant?.contact?.twitter {
                socialNetwork.text = twitter
            }
            if let postalCode = restaraurant?.location?.address{
                postalCodeLbl.text = postalCode
               
            }
            
            
//            if let lat = restaraurant?.location?.lat, let lng = restaraurant?.location?.lng {
//                print("latitude je \(lat)")
//                print("longitude je \(lng)")
//                self.getCoordinatesData(latitude: lat, longitude: lng)
//            }
        }
    }
    
//    var restoran: Restaurants?
    
    let topHalfContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topContainer : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let mapView: MKMapView = {
        let mv = MKMapView()
        mv.clipsToBounds = true
        mv.contentMode = .scaleAspectFit
        return mv
    }()
    
    let middleContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    //mapa unutar top container
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
        view.backgroundColor = .white
        return view
    }()
    let adressLabel: UILabel = {
        let label = UILabel()
        label.text = "Restaurant adress"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        return label
    }()
    let phoneNumber : UILabel = {
        let label = UILabel()
        label.text = "Phone number"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let socialNetwork : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Social network"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    var postalCodeLbl : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Postal Code"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    var topHalfContainerHeight: NSLayoutConstraint?
    var adressLabelHeight: NSLayoutConstraint?
    var phoneNumberHeight: NSLayoutConstraint?
    var postalCodeHeight : NSLayoutConstraint?
    
    func setupViews() {
        view.backgroundColor = .purple
        view.addSubview(topHalfContainer)
        
        topHalfContainer.addSubview(topContainer)
        topContainer.addSubview(mapView)
        topHalfContainer.addSubview(middleContainer)
        
        middleContainer.addSubview(restaurantName)
        middleContainer.addSubview(categoryType)
        
        view.addSubview(bottomContainer)
        
        bottomContainer.addSubview(adressLabel)
        bottomContainer.addSubview(phoneNumber)
        bottomContainer.addSubview(socialNetwork)
        bottomContainer.addSubview(postalCodeLbl)
        
        //top half container
        topHalfContainer.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        topHalfContainerHeight = topHalfContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        topHalfContainerHeight?.isActive = true
        
        // topcontainer
        
        topContainer.anchor(topHalfContainer.topAnchor, left: topHalfContainer.leftAnchor, bottom: middleContainer.topAnchor, right: topHalfContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        mapView.anchor(topContainer.topAnchor, left: topContainer.leftAnchor, bottom: topContainer.bottomAnchor, right: topContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        //middle container
        middleContainer.anchor(nil, left: topHalfContainer.leftAnchor, bottom: topHalfContainer.bottomAnchor, right: topHalfContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 60)
        
        restaurantName.anchor(middleContainer.topAnchor, left: middleContainer.leftAnchor, bottom: nil, right: middleContainer.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        categoryType.anchor(restaurantName.bottomAnchor, left: middleContainer.leftAnchor, bottom: nil, right: middleContainer.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        bottomContainer.anchor(middleContainer.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        adressLabel.anchor(bottomContainer.topAnchor , left: bottomContainer.leftAnchor , bottom: nil, right: bottomContainer.rightAnchor , topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0 )
        
        adressLabelHeight = adressLabel.heightAnchor.constraint(equalTo: bottomContainer.heightAnchor, multiplier: 0.25)
        adressLabelHeight?.isActive = true
        
        phoneNumber.anchor(adressLabel.bottomAnchor, left: bottomContainer.leftAnchor, bottom: nil, right: bottomContainer.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0 )
        
        phoneNumberHeight = phoneNumber.heightAnchor.constraint(equalTo: bottomContainer.heightAnchor, multiplier: 0.25)
        phoneNumberHeight?.isActive = true
        
        socialNetwork.anchor(phoneNumber.bottomAnchor, left: bottomContainer.leftAnchor, bottom: nil, right: bottomContainer.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 26)
        
        postalCodeLbl.anchor(socialNetwork.bottomAnchor, left: bottomContainer.leftAnchor, bottom: nil, right: bottomContainer.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 26)
        
        postalCodeHeight = postalCodeLbl.heightAnchor.constraint(equalTo: bottomContainer.heightAnchor, multiplier: 0.25)
        postalCodeHeight?.isActive = true
        
    }

}


