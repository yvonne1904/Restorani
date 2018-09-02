//
//  Objekat za netvorking.swift
//  Restorani preko koda
//
//  Created by Jovana Jovovic on 9/2/18.
//  Copyright © 2018 Jovana Jovovic. All rights reserved.
//

import Foundation

//za ntevorking objekat koji mora da se slaze sa jsonom koji dobijamo preko linka zbog da bi mogao na ispravan nacin da radi


struct Object: Codable {
    let restaurants :[Restaurants]
}
struct Restaurants : Codable {
    let name : String?
    let backgroundImageURL : String?
    let category : String?
    
}
