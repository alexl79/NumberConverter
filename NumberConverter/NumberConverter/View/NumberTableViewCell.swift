//
//  NumberTableViewCell.swift
//  NumberConverter
//
//  Created by Alexander Lobanov on 01.09.16.
//  Copyright © 2016 SurfStudio. All rights reserved.
//

import Foundation
import UIKit
import NumberConverterFrm

class NumberTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var labelNumber: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        labelNumber.text = ""
    }
    
    func setupCell(item: NSNumber)
    {
        labelNumber.text = NumberConverter.convert(item.longLongValue)
    }
    
    
}