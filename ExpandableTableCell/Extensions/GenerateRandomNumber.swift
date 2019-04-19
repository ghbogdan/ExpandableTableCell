//
//  GenerateRandomNumber.swift
//  ExpandableTableCell
//
//  Created by Bogdan Gheorghe on 6/25/18.
//  Copyright © 2018 Bogdan Gheorghe. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat
{
    static func randomFloat() -> CGFloat
    {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
