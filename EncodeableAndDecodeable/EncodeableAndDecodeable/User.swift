//
//  User.swift
//  EncodeableAndDecodeable
//
//  Created by pgq on 2017/12/9.
//  Copyright © 2017年 pgq. All rights reserved.
//

import UIKit

struct User: Decodable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var phone: String
    var website: String
    var company: Company
    var address: Address
}

struct Address: Decodable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: Geo
}

struct Geo: Decodable {
    var lat: String
    var lng: String
}

struct Company: Decodable {
    var name: String
    var catchPhrase: String
    var bs: String
}

