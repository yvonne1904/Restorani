//
//  ViewController.swift
//  Restorani preko koda
//
//  Created by Jovana Jovovic on 9/2/18.
//  Copyright © 2018 Jovana Jovovic. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .blue
        tabBar.barTintColor = UIColor(r: 42, g: 42, b: 42)
        
        let louncVC = LounchViewController()
        louncVC.title = "Lounch"
        let lunchNavigation = UINavigationController(rootViewController: louncVC)
        louncVC.tabBarItem.image = UIImage(named: "tab_lunch")?.withRenderingMode(.alwaysTemplate)
        louncVC.tabBarItem.selectedImage = UIImage(named: "tab_lunch")?.withRenderingMode(.alwaysOriginal)
        louncVC.navigationItem.title = "Internet"
        lunchNavigation.title = "Lounch"
        
        let obrisiVC = LunchTwoController()
        obrisiVC.title = "Obrisi"
        let obrisiNavigation = UINavigationController(rootViewController: obrisiVC)
        obrisiVC.tabBarItem.image = UIImage(named: "tab_lunch")?.withRenderingMode(.alwaysTemplate)
        obrisiVC.tabBarItem.selectedImage = UIImage(named: "tab_lunch")?.withRenderingMode(.alwaysOriginal)
        obrisiVC.navigationItem.title = "Obrisi"
        obrisiNavigation.title = "Obrisi"
        
        let internetVC = InternetViewController()
        internetVC.title = "Internet"
        let intneretNavigation = UINavigationController(rootViewController: internetVC)
        internetVC.tabBarItem.image = UIImage(named: "tab_internets")?.withRenderingMode(.alwaysTemplate)
        internetVC.tabBarItem.selectedImage = UIImage(named: "tab_internets")?.withRenderingMode(.alwaysOriginal)
        
        UITabBar.appearance().tintColor = .white
        intneretNavigation.title = "Internet"
        
        viewControllers = [lunchNavigation, obrisiNavigation, intneretNavigation]
    }
    
}

