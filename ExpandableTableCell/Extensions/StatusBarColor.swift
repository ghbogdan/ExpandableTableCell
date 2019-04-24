//
//  StatusBarColor.swift
//  ExpandableTableCell
//
//  Created by Bogdan Gheorghe on 6/25/18.
//  Copyright © 2018 Bogdan Gheorghe. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication
{
    var statusBarView: UIView?
    {
        if responds(to: Selector(("statusBar")))
        {
            return value(forKey: "statusBar") as? UIView
        }
        
        return nil
    }
}
