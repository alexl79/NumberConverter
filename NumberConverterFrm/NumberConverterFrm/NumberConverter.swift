//
//  NumberConverter.swift
//  NumberConverter
//
//  Created by Alexander Lobanov on 31.08.16.
//  Copyright © 2016 SurfStudio. All rights reserved.
//

import Foundation

public class NumberConverter
{
    //digits
    private let NamesDigitKey = "digit"
    private let NamesDigitDKey = "digit-d"
    
    //tens
    private let NamesTenKey = "ten"
    
    //hundreds
    private let NamesHundKey = "hund"

    //thousends and more
    private static let NamesThousAnsMoreKey = ["thous-d", "million-d", "billion-d", "trillion-d"]
    
    private func wordForLevel(level : Int, digitChar: Character, nextDigitChar: Character) -> String
    {
        let digit = Int(String(digitChar))!
        let digitNext = Int(String(nextDigitChar))!
        
        var str = ""
        
        switch level % 3 {
        case 0: // digits
            if digitNext == 1
            {
                if digit != 0
                {
                    str = NSLS(NamesDigitKey + "-\(digitNext)\(digit)")
                }
                else
                {
                    str = NSLS(NamesTenKey + "-\(digitNext)")
                }
            }
            else
            {
                str = (digit > 2 || level != 3 ? NSLS(NamesDigitKey + "-\(digit)") : NSLS(NamesDigitDKey + "-\(digit)"))
            }
            
        case 1: // tens
            if digit != 1
            {
                str = NSLS(NamesTenKey + "-\(digit)")
            }
        case 2: // hundreds
            
            str = NSLS(NamesHundKey + "-\(digit)")
            
        default:
            break
        }
        
        return str != "" ? str + " " : ""
    }
    
    public static func convert(number: Int64) -> String
    {
        var resultArr = [String]()
        var subArr = [String]()
        
        let numChars: [Character] = String(number).characters.reverse()
        var subNum: [Character] = ["0","0","0"]
        
        let converter = NumberConverter()
        
        for i in 0 ..< numChars.count
        {
            if i % 3 == 0
            {
                let n = Int(String(subNum))!
                if n != 0 && (i-1) / 3 > 0 {
                    resultArr.append(String.declForValue(n, key: NamesThousAnsMoreKey[(i-1) / 3 - 1])! + " ")
                }
                
                resultArr += subArr
                
                subNum = ["0","0","0"]
                subArr = [String]()
            }
            
            let currChar: Character = numChars[i]
            let nextChar: Character = i < numChars.count - 1 ? numChars[i + 1] : "0"
            
            subArr.append(converter.wordForLevel(i, digitChar: currChar, nextDigitChar: nextChar))
            subNum[2 - i % 3] = currChar
        }
        
        let n = Int(String(subNum))!
        if n != 0 && (numChars.count-1) / 3 > 0 {
            resultArr.append(String.declForValue(n, key: NamesThousAnsMoreKey[(numChars.count-1) / 3 - 1])! + " ")
        }
        resultArr += subArr
        
        return resultArr.reverse().joinWithSeparator("").stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    
}