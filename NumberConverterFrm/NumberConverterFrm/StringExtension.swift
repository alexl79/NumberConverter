//
//  StringExtension.swift
//  NumberConverterFrm
//
//  Created by Alexander Lobanov on 31.08.16.
//  Copyright © 2016 SurfStudio. All rights reserved.
//

import Foundation

extension String
{
    static func declForValue(value: Int, words: [String]) -> String?
    {
        if words.count != 3 {
            return nil
        }
        
        let dd = (value) % 100
        let d = (value) % 10
        
        if (d == 0 || d > 4 || dd == 11 || dd == 12 || dd == 13 || dd == 14)
        {
            return words[0]
        }
        
        if (d != 1 && d < 5)
        {
            return words[2]
        }
        
        if (d == 1)
        {
            return words[1]
        }
        
        return words[0]
    }

    static func declForValue(value: Int, key: String) -> String?
    {
        var words = [String]()
        
        for i in 1 ... 3
        {
            words.append(NSLS(key + "-" + String(i)))
        }
        
        return declForValue(value, words: words)
    }
}