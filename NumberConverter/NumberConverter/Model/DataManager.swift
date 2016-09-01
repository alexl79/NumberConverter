//
//  DataManager.swift
//  NumberConverter
//
//  Created by Alexander Lobanov on 01.09.16.
//  Copyright © 2016 SurfStudio. All rights reserved.
//

import Foundation

class DataManager
{
    let kPlistName = "input"
    
    func readItems() -> [NSNumber]
    {
        let path = NSBundle.mainBundle().pathForResource(kPlistName, ofType: "plist")!
        return NSArray(contentsOfFile: path) as! [NSNumber]
    }
}