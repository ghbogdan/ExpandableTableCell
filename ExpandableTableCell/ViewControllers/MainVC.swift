//
//  MainVC.swift
//  ExpandableTableCell
//
//  Created by Bogdan Gheorghe on 6/25/18.
//  Copyright © 2018 Bogdan Gheorghe. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    /*
    // MARK: - Variables and Constants
    */
    
    var expandedRows = Set<Int>()
    var selectedCell : NSInteger = 0
    var disableTableCells : Bool = false
    var placeholderImages : Array = ["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg", "5.jpeg", "6.jpeg", "7.jpeg", "8.jpeg", "9.jpeg", "10.jpeg"]
    
    
    /*
    // MARK: - Outlets
    */
    
    @IBOutlet weak var nbNavigationBar: UINavigationBar!
    @IBOutlet weak var tvExpandableTable: UITableView!
    
    
    /*
    // MARK: - VC Status
    */
    
    override func viewDidLoad()
    {
        print("MainVC > viewDidLoad")
        
        super.viewDidLoad()
        
        nbNavigationBar.setValue(true, forKey: "hidesShadow")
        
        self.tvExpandableTable.rowHeight = UITableView.automaticDimension
        self.tvExpandableTable.tableFooterView = UIView()
    }
    
    
    /*
    // MARK: - UITableView delegate methods
    */
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        print("MainVC > numberOfSectionsInTableView")
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print("MainVC > tableView > numberOfRowsInSection")
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        print("MainVC > tableView > cellForRowAtIndexPath > indexPath\(indexPath)")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell") as! ExpandableCell
        
        cell.isExpanded = self.expandedRows.contains(indexPath.row)
        cell.lblTitle.text = "OPTION \(indexPath.row + 1)"
        cell.ivPlaceholderImage.image = UIImage(named: placeholderImages[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        print("MainVC > tableView > willSelectRowAtIndexPath > indexPath\(indexPath)")
        
        if ( (disableTableCells == true) && ( indexPath.row > 0 ) )
        {
            return nil
        }
        
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("MainVC > tableView > didSelectRowAtIndexPath > indexPath\(indexPath)")
        
        selectedCell = indexPath.row

        guard let cell = tableView.cellForRow(at: indexPath) as? ExpandableCell
            else { return }

        switch cell.isExpanded
        {
            case true:
                self.expandedRows.remove(indexPath.row)
            case false:
                self.expandedRows.insert(indexPath.row)
        }

        cell.isExpanded = !cell.isExpanded

        self.tvExpandableTable.beginUpdates()
        self.tvExpandableTable.endUpdates()

        tableView.scrollToRow(at: indexPath, at: .top, animated: false)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        print("MainVC > tableView > didDeselectRowAt > indexPath\(indexPath)")
        
        let indexPath = IndexPath.init(row: selectedCell, section: 0)
        tvExpandableTable.deselectRow(at: indexPath, animated: true)
        
        // Colapse cell
        guard let cell = tvExpandableTable.cellForRow(at: indexPath) as? ExpandableCell
            else { return }
        
        self.expandedRows.remove(indexPath.row)
        
        cell.isExpanded = false
        
        // Refresh table
        self.tvExpandableTable.beginUpdates()
        self.tvExpandableTable.endUpdates()
    }

    
    /*
    // MARK: - Memory Management
    */

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

