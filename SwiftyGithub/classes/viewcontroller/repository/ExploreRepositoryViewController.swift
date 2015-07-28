//
//  ExploreRepositoryViewController.swift
//  SwiftyGithub
//
//  Created by Kohei Tabata on 7/28/15.
//  Copyright (c) 2015 Kohei Tabata. All rights reserved.
//

import UIKit
import SnapKit

class ExploreRepositoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    private var tableView = UITableView()
    private var searchBar = UISearchBar()
    private var dataList = [Repository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        tableView.tableHeaderView = searchBar
        let searchBarSize = searchBar.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        tableView.tableHeaderView?.frame = CGRectMake(0, 0, searchBarSize.width, searchBarSize.height)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(BaseTableViewCell.self, forCellReuseIdentifier: BaseTableViewCell.cellIdentifier())
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view).insets(EdgeInsetsZero)
        }
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(BaseTableViewCell.cellIdentifier()) as! BaseTableViewCell
        let repository = dataList[indexPath.row]
        cell.textLabel?.text = repository.name.stringByAppendingString(repository.owner.name)
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //MARK: - UISearchBarDelegate
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            dataList = [Repository]()
            tableView.reloadData()
            return
        }
        
        RepositoryApi().fetchSearchedRepositoryWithQuery(searchText, completionBlock: {[weak self] (result, error) -> Void in
            if let error = error {
                println("error:\(error)")
                return
            }
            if let result = result {
                self?.dataList = result
                self?.tableView.reloadData()
            }
            })
    }
}