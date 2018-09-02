//
//  LounchViewController.swift
//  Restorani preko koda
//
//  Created by Jovana Jovovic on 9/2/18.
//  Copyright © 2018 Jovana Jovovic. All rights reserved.
//

import UIKit
import LBTAComponents


class LounchViewController: UIViewController {
    
    var object: Object? {
        didSet {
            restaurantCollectionView.reloadData()
        }
    }
    
    //kad pravim collection view koristim lazyvar jer nece da prihvati let
    //1 korak
    lazy var restaurantCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .yellow
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavigationBar()
    }
    
    func setupViews() {
        view.backgroundColor = .red
        title = "Lunch Tyme"
        self.navigationItem.title = "Lunch Tyme"
        //2 dodajemo ga u view
        view.addSubview(restaurantCollectionView)
        //4 registrujem tu celiju
        restaurantCollectionView.register(RestaurantCell.self, forCellWithReuseIdentifier: "cell")
        //5 stavljam konstreinte
        restaurantCollectionView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        networkingFetchData()
    }
    
    func setupNavigationBar() {
        //ona mapa desno gore u navigation baru
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem?.image = UIImage(named:"icon_map")
    }
    
    @objc func addTapped() {
        print("klik klik")
    }
    //Ova funkcija radi sav networking
    func networkingFetchData() {
        //link iz safarija za restorane
        let s = "http://sandbox.bottlerocketapps.com/BR_iOS_CodingExam_2015_Server/restaurants.json"
        guard let url = URL(string: s) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let object = try JSONDecoder().decode(Object.self, from: data)
                DispatchQueue.main.async {
                    self.object = object
                }
            } catch let error {
                print(error.localizedDescription)
                
            }
            } .resume()
    }
}

extension LounchViewController: UICollectionViewDelegateFlowLayout , UICollectionViewDelegate , UICollectionViewDataSource {
    // 6 koristim delegate i datasource func da bi popunio datu celiju
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = object?.restaurants.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //7 pravimo konkretnu celiju 
        let cell = restaurantCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RestaurantCell
        cell.restaurant = object?.restaurants[indexPath.item]
        return cell
    }
    //ovde povecavam visinu i sirinu svake celije to je ovo gde je slika restorana i hrane
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: restaurantCollectionView.frame.size.width, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("OPA")
    }
    
}
