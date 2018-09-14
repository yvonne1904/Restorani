//
//  lounch3ViewController.swift
//  Restorani preko koda
//
//  Created by Jovana Jovovic on 9/14/18.
//  Copyright © 2018 Jovana Jovovic. All rights reserved.
//

import UIKit
var object: Object? {
    didSet {
        lounch3ViewController.reloadData()
    }
class lounch3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        }
        
        //kad pravim collection view koristim lazyvar jer nece da prihvati let
        //1 korak
        lazy var lounch3ViewController: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.backgroundColor = .white
            layout.minimumInteritemSpacing = 5
            layout.minimumLineSpacing = 5
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
            self.navigationItem.title = "Obrisi"
            //2 dodajemo ga u view
            view.addSubview(lounch3ViewController)
            //4 registrujem tu celiju
            lounch3ViewController.register(LounchTwoCell.self, forCellWithReuseIdentifier: "cell")
            //5 stavljam konstreinte
            lounch3ViewController.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            
            networkingFetchData()
        }
        
        func setupNavigationBar() {
            //ona mapa desno gore u navigation baru
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
            navigationItem.rightBarButtonItem?.image = UIImage(named:"icon_map")?.withRenderingMode(.alwaysOriginal)
        }
        
        @objc func addTapped() {
            let allRestauranVC = AllRestarantsController()
            self.navigationController?.pushViewController(allRestauranVC, animated: true)
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
    
    extension LounchTwoController: UICollectionViewDelegateFlowLayout , UICollectionViewDelegate , UICollectionViewDataSource {
        // 6 koristim delegate i datasource func da bi popunio datu celiju
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if let count = object?.restaurants.count {
                return count
            }
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            //7 pravimo konkretnu celiju
            let cell = lounchTwoCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LounchTwoCell
            cell.restaurant = object?.restaurants[indexPath.item]
            return cell
        }
        //ovde povecavam visinu i sirinu svake celije to je ovo gde je slika restorana i hrane
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: lounchTwoCollection.frame.size.width / 2 - 10, height: 100)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // 2) pravimo promenljivu date klase tj kontrolera sa kojim hocemo kontakt
            let mapView = MapView()
            mapView.restaurant = object?.restaurants[indexPath.item]
            //4) idemo na taj kontroler zajedno sa poslatim podacima
            
            self.navigationController?.pushViewController(mapView, animated: true)
        }
    }


    }
}
