//
//  ViewController.swift
//  NumberConverter
//
//  Created by Alexander Lobanov on 31.08.16.
//  Copyright © 2016 SurfStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    
    let ESTIMATED_CELL_HEIGHT: CGFloat = 44.0
    
    lazy var items: [NSNumber] = {
        DataManager().readItems()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareView()
    {
        let nib = UINib(nibName: NumberTableViewCell.nameOfClass, bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: NumberTableViewCell.nameOfClass)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = ESTIMATED_CELL_HEIGHT
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NumberTableViewCell.nameOfClass, forIndexPath: indexPath) as! NumberTableViewCell
        
        cell.setupCell(items[indexPath.row])
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate
{
    
}

