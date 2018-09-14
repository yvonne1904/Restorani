//
//  mapview.swift
//  Restorani preko koda
//
//  Created by Jovana Jovovic on 9/3/18.
//  Copyright © 2018 Jovana Jovovic. All rights reserved.
//

import UIKit
import MapKit

class MapView: UIViewController, UITextFieldDelegate {
    
    // 1) Prvo pravimo promenljivu tipa Restoran tj onog tipa iz koga treba da dobijemo podatke
    var restaurant: Restaurants? {
        didSet {
            if let name = restaurant?.name {
                restaurantName.text = name
            }

            if let category = restaurant?.category {
                categoryType.text = category
            }

            if let phone = restaurant?.contact?.phone {
                phoneNumber.text = phone
            }
            if let adress = restaurant?.location?.address {
                adressLabel.text = adress
            }
            if let twitter = restaurant?.contact?.twitter {
                socialNetwork.text = twitter
            }
            if let postalCode = restaurant?.location?.postalCode{
                postalCodeLbl.text = postalCode
               
            }
        }
    }
    
//    var restoran: Restaurants?
    
    func allCoordinatesOnMap() {
        if let lat = restaurant?.location?.lat, let lng = restaurant?.location?.lng {
            print("LAT \(lat)")
            print("LNG \(lng)")
            let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: lng)
            let point: MKPointAnnotation = MKPointAnnotation()
            point.coordinate = coordinates
            mapView.addAnnotation(point)  // dodajemo anotaciju (pin)
            
            let region: MKCoordinateRegion =  mapView.regionThatFits(MKCoordinateRegionMakeWithDistance(coordinates, 2000, 2000))
            mapView.setRegion(region, animated: true)  // iscrtavamo mapu sa zadatom koordinatom
        }
    }
    
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
    
    /////BottomContainer
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
    
    let nekaSlika: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "deneris")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        //imageView.translatesAutoresizingMaskIntoConstraints = false posto radi slika ne mora ,ali da nije radila onda ovako stavim
        return imageView
    }()
    
    let phoneNumber : UILabel = {
        let label = UILabel()
        label.text = "Phone number"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dugme : UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(named: "deneris"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.clipsToBounds = true
        button.setTitle("Joka <3", for: .normal)
        button.backgroundColor = .purple
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let textfield: UITextField = {
        let tf = UITextField()
        //tf.text = "Joka"
        tf.placeholder = "Joka"
        tf.backgroundColor = .red
        tf.keyboardType = .namePhonePad
        tf.textColor = .blue
        tf.layer.cornerRadius = 5
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
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
    var socialNetworkHeight: NSLayoutConstraint?
    var postalCodeHeight : NSLayoutConstraint?
    var textfieldWidth: NSLayoutConstraint?
    
    var nekaSlikaWidth: NSLayoutConstraint?
    var dugmeWidth : NSLayoutConstraint?
    
    func setupViews() {
        allCoordinatesOnMap()
        view.backgroundColor = .purple
        view.addSubview(topHalfContainer)
        
        topHalfContainer.addSubview(topContainer)
        topContainer.addSubview(mapView)
        topHalfContainer.addSubview(middleContainer)
        
        middleContainer.addSubview(restaurantName)
        middleContainer.addSubview(categoryType)
        
        view.addSubview(bottomContainer)
        
        bottomContainer.addSubview(adressLabel)
        bottomContainer.addSubview(nekaSlika)
        bottomContainer.addSubview(phoneNumber)
        bottomContainer.addSubview(dugme)
        bottomContainer.addSubview(socialNetwork)
        bottomContainer.addSubview(textfield)
        textfield.delegate = self
        bottomContainer.addSubview(postalCodeLbl)
        
        //top half container
        topHalfContainer.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        topHalfContainerHeight = topHalfContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        topHalfContainerHeight?.isActive = true
        
        // topcontainer
        
        topContainer.anchor(topHalfContainer.topAnchor, left: topHalfContainer.leftAnchor, bottom: middleContainer.topAnchor, right: topHalfContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        mapView.anchor(topContainer.topAnchor, left: topContainer.leftAnchor, bottom: topContainer.bottomAnchor, right: topContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        //Middle container
        middleContainer.anchor(nil, left: topHalfContainer.leftAnchor, bottom: topHalfContainer.bottomAnchor, right: topHalfContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 60)
        
        restaurantName.anchor(middleContainer.topAnchor, left: middleContainer.leftAnchor, bottom: nil, right: middleContainer.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        categoryType.anchor(restaurantName.bottomAnchor, left: middleContainer.leftAnchor, bottom: nil, right: middleContainer.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        //Bottom
        bottomContainer.anchor(middleContainer.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        adressLabel.anchor(bottomContainer.topAnchor , left: bottomContainer.leftAnchor , bottom: nil, right: bottomContainer.rightAnchor , topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0 )
        
        adressLabelHeight = adressLabel.heightAnchor.constraint(equalTo: bottomContainer.heightAnchor, multiplier: 0.20)
        adressLabelHeight?.isActive = true
        
        nekaSlika.anchor(adressLabel.topAnchor, left: nil, bottom: adressLabel.bottomAnchor, right: bottomContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        nekaSlikaWidth = nekaSlika.widthAnchor.constraint(equalTo: adressLabel.heightAnchor, multiplier: 1)
        nekaSlikaWidth?.isActive = true
    
        phoneNumber.anchor(adressLabel.bottomAnchor, left: bottomContainer.leftAnchor, bottom: nil, right: bottomContainer.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0 )
        
        phoneNumberHeight = phoneNumber.heightAnchor.constraint(equalTo: bottomContainer.heightAnchor, multiplier: 0.20)
        phoneNumberHeight?.isActive = true
        
        socialNetwork.anchor(phoneNumber.bottomAnchor, left: bottomContainer.leftAnchor, bottom: nil, right: textfield.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        socialNetworkHeight = socialNetwork.heightAnchor.constraint(equalTo: bottomContainer.heightAnchor, multiplier: 0.20)
        socialNetworkHeight?.isActive = true
        
        postalCodeLbl.anchor(socialNetwork.bottomAnchor, left: bottomContainer.leftAnchor, bottom: nil, right: bottomContainer.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        postalCodeHeight = postalCodeLbl.heightAnchor.constraint(equalTo: bottomContainer.heightAnchor, multiplier: 0.20)
        postalCodeHeight?.isActive = true
        
       dugme.anchor(phoneNumber.topAnchor, left: nil, bottom: phoneNumber.bottomAnchor, right: bottomContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        dugmeWidth = dugme.widthAnchor.constraint(equalTo: postalCodeLbl.heightAnchor, multiplier: 1)
        dugmeWidth?.isActive = true
        
        textfield.anchor(socialNetwork.topAnchor, left: nil, bottom: socialNetwork.bottomAnchor, right: bottomContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        textfieldWidth = textfield.widthAnchor.constraint(equalTo: socialNetwork.heightAnchor, multiplier: 1)
        textfieldWidth?.isActive = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return true
    }

}


