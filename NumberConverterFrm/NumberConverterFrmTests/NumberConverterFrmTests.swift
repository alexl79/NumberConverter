//
//  NumberConverterFrmTests.swift
//  NumberConverterFrmTests
//
//  Created by Alexander Lobanov on 31.08.16.
//  Copyright © 2016 SurfStudio. All rights reserved.
//

import XCTest
@testable import NumberConverterFrm

class NumberConverterFrmTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: - main
    
    func testConvert()
    {
        var s = ""
        
        s = NumberConverter.convert(-1)
        XCTAssert(s == NSLS("NotAValidNumber"), "error converting: (\(s))")
        
        s = NumberConverter.convert(1000000000000000)
        XCTAssert(s == NSLS("NotAValidNumber"), "error converting: (\(s))")
        
        s = NumberConverter.convert(23)
        XCTAssert(s == "двадцать три", "error converting: (\(s))")
        
        s = NumberConverter.convert(423)
        XCTAssert(s == "четыреста двадцать три", "error converting: (\(s))")
        
        s = NumberConverter.convert(1423)
        XCTAssert(s == "одна тысяча четыреста двадцать три", "error converting: (\(s))")
        
        s = NumberConverter.convert(5423)
        XCTAssert(s == "пять тысяч четыреста двадцать три", "error converting: (\(s))")

        s = NumberConverter.convert(22423)
        XCTAssert(s == "двадцать две тысячи четыреста двадцать три", "error converting: (\(s))")

        s = NumberConverter.convert(13423)
        XCTAssert(s == "тринадцать тысяч четыреста двадцать три", "error converting: (\(s))")
        
        s = NumberConverter.convert(100423)
        XCTAssert(s == "сто тысяч четыреста двадцать три", "error converting: (\(s))")
        
        s = NumberConverter.convert(505403)
        XCTAssert(s == "пятьсот пять тысяч четыреста три", "error converting: (\(s))")
        
        s = NumberConverter.convert(1111111)
        XCTAssert(s == "один миллион сто одиннадцать тысяч сто одиннадцать", "error converting: (\(s))")
        
        s = NumberConverter.convert(945111111)
        XCTAssert(s == "девятьсот сорок пять миллионов сто одиннадцать тысяч сто одиннадцать", "error converting: (\(s))")
        
        s = NumberConverter.convert(945111111)
        XCTAssert(s == "девятьсот сорок пять миллионов сто одиннадцать тысяч сто одиннадцать", "error converting: (\(s))")
        
        s = NumberConverter.convert(18945111111)
        XCTAssert(s == "восемнадцать миллиардов девятьсот сорок пять миллионов сто одиннадцать тысяч сто одиннадцать", "error converting: (\(s))")

        s = NumberConverter.convert(1000000000000)
        XCTAssert(s == "один триллион", "error converting: (\(s))")

        s = NumberConverter.convert(2000000000000)
        XCTAssert(s == "два триллиона", "error converting: (\(s))")

        s = NumberConverter.convert(12000000000000)
        XCTAssert(s == "двенадцать триллионов", "error converting: (\(s))")
        
    }
    
    func testDecl()
    {
        var s: String? = nil
        
        s = String.declForValue(1, key: "thous")
        XCTAssert(s == "тысяча", "error")

        s = String.declForValue(2, key: "thous")
        XCTAssert(s == "тысячи", "error")

        s = String.declForValue(5, key: "thous")
        XCTAssert(s == "тысяч", "error")

        s = String.declForValue(21, key: "thous")
        XCTAssert(s == "тысяча", "error")

        s = String.declForValue(30, key: "thous")
        XCTAssert(s == "тысяч", "error")

    }
}
