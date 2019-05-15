//
//  SearchResult.swift
//  AlbumSearchAPI
//
//  Created by Thiago Magalhaes on 2019-05-14.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public struct SearchResult<E : Codable>: Codable {
    
    let resultCount: Int
    let results: [E]
    
    enum CodingKeys: String, CodingKey {
        case resultCount = "resultCount"
        case results = "results"
    }
}
