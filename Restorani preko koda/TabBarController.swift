//
//  ViewController.swift
//  Restorani preko koda
//
//  Created by Jovana Jovovic on 9/2/18.
//  Copyright © 2018 Jovana Jovovic. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .blue
        tabBar.barTintColor = UIColor(r: 42, g: 42, b: 42)
        
        let louncVC = LounchViewController()
        louncVC.title = "Lounch"
        let lunchNavigation = UINavigationController(rootViewController: louncVC)
        louncVC.tabBarItem.image = UIImage(named: "tab_lunch")?.withRenderingMode(.alwaysTemplate)
        louncVC.tabBarItem.selectedImage = UIImage(named: "tab_lunch")?.withRenderingMode(.alwaysOriginal)
        louncVC.navigationItem.title = "Internet"
        lunchNavigation.title = "Lounch"
        
        let internetVC = InternetViewController()
        internetVC.title = "Internet"
    
        let intneretNavigation = UINavigationController(rootViewController: internetVC)
        internetVC.tabBarItem.image = UIImage(named: "tab_internets")?.withRenderingMode(.alwaysTemplate)
        internetVC.tabBarItem.selectedImage = UIImage(named: "tab_internets")?.withRenderingMode(.alwaysOriginal)
        
        UITabBar.appearance().tintColor = .white
        intneretNavigation.title = "Internet"
        
        viewControllers = [lunchNavigation, intneretNavigation]
    }
    
}

