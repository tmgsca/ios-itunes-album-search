//
//  iTunesAlbumSearch.swift
//  AlbumSearchAPI
//
//  Created by Thiago Magalhaes on 2019-05-14.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import Moya

enum iTunesAlbumAPI {
    case searchAlbumByArtist(term: String)
}

extension iTunesAlbumAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://itunes.apple.com")!
    }
    
    var path: String {
        switch self {
        case .searchAlbumByArtist:
            return "/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .searchAlbumByArtist:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .searchAlbumByArtist:
            return "".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .searchAlbumByArtist(let term):
            return .requestParameters(parameters: ["term": term, "media": "music", "entity": "album", "attribute": "artistTerm"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
