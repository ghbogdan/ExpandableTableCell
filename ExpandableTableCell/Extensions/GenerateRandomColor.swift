//
//  GenerateRandomColor.swift
//  ExpandableTableCell
//
//  Created by Bogdan Gheorghe on 6/25/18.
//  Copyright © 2018 Bogdan Gheorghe. All rights reserved.
//

import Foundation
import UIKit

extension UIColor
{
    static func randomColor() -> UIColor
    {
        return UIColor(red:   .randomFloat(),
                       green: .randomFloat(),
                       blue:  .randomFloat(),
                       alpha: 1.0)
    }
}
