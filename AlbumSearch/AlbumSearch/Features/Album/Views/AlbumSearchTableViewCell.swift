//
//  AlbumSearchTableViewCell.swift
//  AlbumSearch
//
//  Created by Thiago Magalhaes on 2019-05-14.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit
import AlbumSearchModel
import Kingfisher

class AlbumSearchTableViewCell: UITableViewCell {
    
    static let id = "ALBUM_SEARCH_TABLE_VIEW_CELL"
    
    var album: Album? {
        didSet {
            name.text = album?.name
            releaseDate.text = album?.releaseDate.description
            if let artworkUrlString = album?.artworkUrl, let url = URL(string: artworkUrlString) {
                artwork.kf.setImage(with: url, options: [.transition(.fade(0.5))])
            }
        }
    }
    
    @IBOutlet weak var artwork: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
}
