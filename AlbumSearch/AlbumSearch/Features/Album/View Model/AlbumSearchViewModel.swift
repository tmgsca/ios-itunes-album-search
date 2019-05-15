//
//  AlbumSearchViewModel.swift
//  AlbumSearch
//
//  Created by Thiago Magalhaes on 2019-05-14.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import AlbumSearchModel
import AlbumSearchAPI

class AlbumSearchViewModel {
    
    var onAlbums: (([Album]) -> ())? {
        didSet {
            onAlbums?(albums)
        }
    }
    var onErrorMessage: ((String?) -> ())? {
        didSet {
            onErrorMessage?(errorMessage)
        }
    }
    var onShowLoading: ((Bool) -> ())? {
        didSet {
            onShowLoading?(showLoading)
        }
    }
    var onShowEmptyView: ((Bool) -> ())? {
        didSet {
            onShowEmptyView?(showEmptyView)
        }
    }
    
    var onAlbumSelected: ((Album) -> ())?
    
    private var albums: [Album] = [] {
        didSet {
            onAlbums?(albums)
        }
    }
    
    private var errorMessage: String? {
        didSet {
            if oldValue != errorMessage {
                onErrorMessage?(errorMessage)
            }
        }
    }
    
    private var showLoading: Bool = false {
        didSet {
            if oldValue != showLoading {
                onShowLoading?(showLoading)
            }
        }
    }
    
    private var showEmptyView: Bool = false {
        didSet {
            if oldValue != showEmptyView {
                onShowEmptyView?(showEmptyView)
            }
        }
    }
    
    func didSelectAlbum(album: Album) {
        onAlbumSelected?(album)
    }
    
    func queryAlbums(artist: String) {
        showLoading = true
        AlbumSearchAPI.shared.queryAlbums(query: artist) { [weak self] outcome in
            switch outcome {
            case .success(let result):
                self?.albums = result.results
            case .failure(_, let reason):
                self?.errorMessage = reason
            }
            self?.showLoading = false
        }
    }
}
