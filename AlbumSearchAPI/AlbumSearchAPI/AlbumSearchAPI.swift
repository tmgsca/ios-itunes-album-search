//
//  AlbumSearchAPI.swift
//  AlbumSearchAPI
//
//  Created by Thiago Magalhaes on 2019-05-14.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import Moya

public class AlbumSearchAPI {
    
    public static let shared = AlbumSearchAPI()
    
    private let provider: MoyaProvider<iTunesAlbumAPI>
    private let jsonDecoder: JSONDecoder
    
    private init() {
        provider = MoyaProvider<iTunesAlbumAPI>()
        jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
    }
    
    public func queryAlbums(query: String, callback: ((Outcome<SearchResult<Album>>) -> ())?) {
        provider.request(.searchAlbumByArtist(term: query)) { [unowned self] result in
            switch result {
            case let .success(response):
                do {
                    let searchResult = try response.filterSuccessfulStatusCodes().map(SearchResult<Album>.self, using: self.jsonDecoder)
                    callback?(.success(result: searchResult))
                } catch (let error) {
                    callback?(.failure(error: error, reason: error.localizedDescription))
                }
            case let .failure(error):
                callback?(.failure(error: error, reason: error.localizedDescription))
            }
        }
    }
}
