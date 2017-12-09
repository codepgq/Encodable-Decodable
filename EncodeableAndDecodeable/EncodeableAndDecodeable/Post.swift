//
//  Post.swift
//  EncodeableAndDecodeable
//
//  Created by pgq on 2017/12/9.
//  Copyright © 2017年 pgq. All rights reserved.
//

import Foundation

struct Post: Encodable, Decodable {
    var body: String?
    var title: String?
    var id: Int
    var userId: Int
}
