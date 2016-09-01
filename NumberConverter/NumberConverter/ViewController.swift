//
//  ViewController.swift
//  NumberConverter
//
//  Created by Alexander Lobanov on 31.08.16.
//  Copyright © 2016 SurfStudio. All rights reserved.
//

import UIKit
import NumberConverterFrm

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(NumberConverter.convert(1123112313))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

