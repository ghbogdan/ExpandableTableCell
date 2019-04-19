//
//  ExpandableCell.swift
//  ExpandableTableCell
//
//  Created by Bogdan Gheorghe on 6/25/18.
//  Copyright © 2018 Bogdan Gheorghe. All rights reserved.
//

import UIKit

class ExpandableCell: UITableViewCell
{
    @IBOutlet weak var vHeaderView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var ivPlaceholderImage: UIImageView!
    @IBOutlet weak var ivPlaceholderImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var ivPlaceholderImageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var ivPlaceholderImageBottomConstraint: NSLayoutConstraint!
    
    var isExpanded:Bool = false
    {
        didSet
        {
            if !isExpanded
            {
                self.ivPlaceholderImage.isHidden = true
                self.ivPlaceholderImageHeightConstraint.constant = 0.0
                self.ivPlaceholderImageTopConstraint.constant = 0.0
                self.ivPlaceholderImageBottomConstraint.constant = 0.0
            }
            else
            {
                self.ivPlaceholderImage.isHidden = false
                self.ivPlaceholderImageHeightConstraint.constant = 125.0
                self.ivPlaceholderImageTopConstraint.constant = 20.0
                self.ivPlaceholderImageBottomConstraint.constant = 29.5
            }
        }
    }
}


