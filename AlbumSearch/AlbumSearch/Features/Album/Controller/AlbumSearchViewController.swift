//
//  AlbumSearchViewController.swift
//  AlbumSearch
//
//  Created by Thiago Magalhaes on 2019-05-14.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit
import AlbumSearchModel

class AlbumSearchViewController: UIViewController {

    private let viewModel = AlbumSearchViewModel()
    
    private var data: [Album] = []
    
    private var typedView: AlbumSearchView {
        return view as! AlbumSearchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typedView.tableView.delegate = self
        typedView.tableView.dataSource = self
        setupObservers()
        
        //FIXME: Add search bar
        viewModel.queryAlbums(artist: "Blind Guardian")
    }
    
    private func setupObservers() {
        viewModel.onAlbums = onAlbumsChange(albums:)
        viewModel.onErrorMessage = onErrorMessage(message:)
        viewModel.onShowLoading = onShowLoadingView(show:)
        viewModel.onShowEmptyView = onShowEmptyView(show:)
        viewModel.onAlbumSelected = onAlbumSelected(album:)
    }
    
    private func onAlbumSelected(album: Album) {
        //TODO: Implement
    }
    
    private func onAlbumsChange(albums: [Album]) {
        data = albums
        typedView.tableView.reloadData()
    }
    
    private func onErrorMessage(message: String?) {
        if let message = message  {
            typedView.showErrorView(message: message)
        } else {
            typedView.hideErrorView()
        }
    }
    
    private func onShowLoadingView(show: Bool) {
        if show {
            typedView.showLoadingView()
        } else {
            typedView.hideLoadingView()
        }
    }
    
    private func onShowEmptyView(show: Bool) {
        if show {
            typedView.showEmptyView(message: "No results")
        } else {
            typedView.hideEmptyView()
        }
    }
}

extension AlbumSearchViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumSearchTableViewCell.id, for: indexPath) as! AlbumSearchTableViewCell
        cell.album = data[indexPath.row]
        return cell
    }
}

extension AlbumSearchViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectAlbum(album: data[indexPath.row])
        typedView.tableView.deselectRow(at: indexPath, animated: true)
    }
}
