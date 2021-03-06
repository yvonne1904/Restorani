//
//  Objekat za netvorking.swift
//  Restorani preko koda
//
//  Created by Jovana Jovovic on 9/2/18.
//  Copyright © 2018 Jovana Jovovic. All rights reserved.
//

import Foundation

struct Object: Codable {
    let restaurants :[Restaurants]
}
struct Restaurants : Codable {
    let name : String?
    let backgroundImageURL : String?
    let category : String?
    let contact: Contact?
    let location: Location?
}

struct Contact: Codable {
    let phone: String?
    let twitter: String?
}

struct Location: Codable {
    let address: String?
    let lat: Double?
    let lng: Double?
    let postalCode : String?
}


