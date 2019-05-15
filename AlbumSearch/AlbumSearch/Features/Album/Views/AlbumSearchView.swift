//
//  AlbumSearchView.swift
//  AlbumSearch
//
//  Created by Thiago Magalhaes on 2019-05-14.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit

class AlbumSearchView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    func showErrorView(message: String) {
        errorLabel.text = message
        errorLabel.superview?.isHidden = false
        tableView.isHidden = true
    }
    
    func hideErrorView() {
        errorLabel.text = nil
        errorLabel.superview?.isHidden = true
        tableView.isHidden = false
    }
    
    func showLoadingView() {
        loadingView.isHidden = false
        activityIndicator.startAnimating()
        tableView.isHidden = true
    }
    
    func hideLoadingView() {
        loadingView.isHidden = true
        activityIndicator.stopAnimating()
        tableView.isHidden = false
    }
    
    func showEmptyView(message: String) {
        emptyLabel.text = message
        emptyLabel.superview?.isHidden = false
    }
    
    func hideEmptyView() {
        emptyLabel.text = nil
        emptyLabel.superview?.isHidden = true
    }
}
