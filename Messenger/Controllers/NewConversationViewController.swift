//
//  NewConversationViewController.swift
//  Messenger
//
//  Created by Yaroslav on 06.05.2021.
//

import UIKit
import JGProgressHUD

class NewConversationViewController: UIViewController {

    private let spiner = JGProgressHUD()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for Users..."
        
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.isHidden = true
        table.register(UITableViewCell.self, forHeaderFooterViewReuseIdentifier: "cell")
        return table
    }()

    private let noResultsLabel: UILabel = {
       let label = UILabel()
        label.isHidden = true
        label.text = "No Results"
        label.textAlignment = .center
        label.textColor = .green
        label.font = .systemFont(ofSize: 21, weight: .medium)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        view.backgroundColor = .white
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationItem.rightBarButtonItem  = UIBarButtonItem(title: "Cancel",
                                                             style: .done,
                                                             target: self,
                                                             action: #selector(dismissSelf))
        searchBar.becomeFirstResponder()
    }

  @objc  private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}

extension NewConversationViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
