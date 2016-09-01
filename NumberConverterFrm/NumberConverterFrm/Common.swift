//
//  Common.swift
//  NumberConverterFrm
//
//  Created by Alexander Lobanov on 31.08.16.
//  Copyright © 2016 SurfStudio. All rights reserved.
//

import Foundation

let BUNDLE_IDENTIFIER = "com.surfstudio.numberconvfrm.NumberConverterFrm"

func NSLS(key: String) -> String {
    return NSLocalizedString(key, tableName: nil, bundle: NSBundle(identifier: BUNDLE_IDENTIFIER)!, value: "", comment: "")
}
