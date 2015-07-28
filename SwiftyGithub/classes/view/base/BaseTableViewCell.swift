//
//  BaseTableViewCell.swift
//  SwiftyGithub
//
//  Created by Kohei Tabata on 7/28/15.
//  Copyright (c) 2015 Kohei Tabata. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    class func cellIdentifier() -> String {
        return NSStringFromClass(self)
    }
}
