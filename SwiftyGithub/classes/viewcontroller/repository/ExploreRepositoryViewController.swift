//
//  ExploreRepositoryViewController.swift
//  SwiftyGithub
//
//  Created by Kohei Tabata on 7/28/15.
//  Copyright (c) 2015 Kohei Tabata. All rights reserved.
//

import UIKit

class ExploreRepositoryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RepositoryApi().fetchSearchedRepositoryWithQuery("SwiftyGithub", completionBlock: { (error) -> Void in
            
        })
    }
}