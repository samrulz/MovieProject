//
//  ResponseDaa.swift
//  MovieDataDemo
//
//  Created by SAGAR THAKARE on 29/12/18.
//  Copyright © 2018 Sandip Musale. All rights reserved.
//

import Foundation

struct MovieData:Codable {
    let show:ShowData?
}

struct ShowData:Codable {
    let title:String?
    let overview:String?
}
