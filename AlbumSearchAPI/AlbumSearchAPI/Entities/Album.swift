//
//  Album.swift
//  AlbumSearchAPI
//
//  Created by Thiago Magalhaes on 2019-05-14.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public struct Album : Codable {
    
    let name: String
    let releaseDate: Date
    let currency: String
    let price: Double
    let artworkUrl: String
    
    enum CodingKeys : String, CodingKey {
        case name = "collectionName"
        case releaseDate = "releaseDate"
        case currency = "currency"
        case price = "collectionPrice"
        case artworkUrl = "artworkUrl100"
    }
}
