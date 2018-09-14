//
//  RestauranCell.swift
//  Restorani preko koda
//
//  Created by Jovana Jovovic on 9/2/18.
//  Copyright © 2018 Jovana Jovovic. All rights reserved.
//

import UIKit
import Kingfisher


//3 pravimo celiju
class RestaurantCell: UICollectionViewCell {
    //ovde smo celiju popunili sa podatcima iz onog structa Restorani
    var restaurant: Restaurants? {
        didSet {
            nameLabel.text = restaurant?.name
            categoryLabel.text = restaurant?.category
            if let imageLink = restaurant?.backgroundImageURL {
                let imageUrl = URL(string: imageLink)
                restaurantImageView.kf.setImage(with: imageUrl)
            }
        }
    }
    
    let restaurantImageView : UIImageView = {
        let image = UIImageView()
        image.image = UIImage (named: "icon_map")
        return image
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
//        label.text = "ime restorana"
        label.font =  UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    let categoryLabel : UILabel = {
        let label = UILabel()
        label.text = "kategorija"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white 
        return label
    }()
    
    
    //napravila sam celiju za restoran koja ce da sadrzi elemente potrebne za restoran
    //ovo je celijin viewDidLoad
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = .green
        addSubview(restaurantImageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        
        restaurantImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        nameLabel.anchor(nil, left: categoryLabel.leftAnchor, bottom: categoryLabel.topAnchor, right: categoryLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 6, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        categoryLabel.anchor( nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 6, rightConstant: 12, widthConstant: 0, heightConstant: 25)
   
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
