//
//  Album.swift
//  AlbumSearchAPI
//
//  Created by Thiago Magalhaes on 2019-05-14.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public struct Album : Codable {
    
    public let name: String
    public let releaseDate: Date
    public let currency: String
    public let price: Double
    public let artworkUrl: String
    
    enum CodingKeys : String, CodingKey {
        case name = "collectionName"
        case releaseDate = "releaseDate"
        case currency = "currency"
        case price = "collectionPrice"
        case artworkUrl = "artworkUrl100"
    }
}
