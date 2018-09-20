//
//  InternetViewController.swift
//  Restorani preko koda
//
//  Created by Jovana Jovovic on 9/2/18.
//  Copyright © 2018 Jovana Jovovic. All rights reserved.
//

import UIKit
import WebKit

final class InternetViewController: UIViewController {
    
    let webViewJoka: WKWebView = {
        let wb = WKWebView()
        return wb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        showWebPage()
    }

    func setupViews() {
        view.addSubview(webViewJoka)
        view.backgroundColor = .white
        title = "Internet"
        //oni batoni vece manje beli
        let backButton = UIBarButtonItem(image: UIImage(named: "ic_webBack")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleBackButton))
        
        let refreshButton = UIBarButtonItem(image: UIImage(named: "ic_webRefresh")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleRefreshButton))
        
        let forwardsButton = UIBarButtonItem(image: UIImage(named: "ic_webForward")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleForwardButton))
        
        navigationItem.leftBarButtonItems = [backButton,refreshButton,forwardsButton]
        
        webViewJoka.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    // link na internet koji vodi do bottle rocket
    func showWebPage() {
        let urlLink = "https://www.bottlerocketstudios.com"
        if let url = URL(string: urlLink) {
            let urlRequest = URLRequest(url: url)
            webViewJoka.load(urlRequest)
        }
    }
    
    @objc func handleBackButton() {
        print("back button")
    }
    @objc func handleRefreshButton() {
        print("refresh Buttom")
        let request = URLRequest(url: webViewJoka.url!)
        webViewJoka.load(request)
    }
    
    @objc func handleForwardButton() {
        
    }
    
}
