//
//  RepositoryViewController.swift
//  SwiftyGithub
//
//  Created by Kohei Tabata on 7/28/15.
//  Copyright (c) 2015 Kohei Tabata. All rights reserved.
//

import UIKit

class RepositoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var tableView = UITableView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(BaseTableViewCell.self, forCellReuseIdentifier: BaseTableViewCell.cellIdentifier())
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(BaseTableViewCell.cellIdentifier()) as! BaseTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Owned"
        case 1:
            cell.textLabel?.text = "Starred"
        case 2:
            cell.textLabel?.text = "Trending"
        case 3:
            cell.textLabel?.text = "Explore"
        default:
            cell.textLabel?.text = ""
        }
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row {
        case 0:
            showOwnedRepositories()
        case 1:
            showStarredRepositories()
        case 2:
            showTrendingRepositories()
        case 3:
            showExploreRepositories()
        default:
            println("unexpected indexPath:\(indexPath)")
        }
    }
    
    //MARK: - private
    
    private func showOwnedRepositories() {
        let viewController = OwnedRepositoryViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func showStarredRepositories() {
        let viewController = StarredRepositoryViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func showTrendingRepositories() {
        let viewController = TrendingRepositoryViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func showExploreRepositories() {
        let viewController = ExploreRepositoryViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}