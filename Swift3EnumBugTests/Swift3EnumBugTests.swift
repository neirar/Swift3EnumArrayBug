//
//  Swift3EnumBugTests.swift
//  Swift3EnumBugTests
//
//  Created by Roberto Neira on 2016-11-12.
//  Copyright © 2016 Roberto Neira. All rights reserved.
//

import XCTest
@testable import Swift3EnumBug


enum MyEnum: Int {
	case NumberZero = 0
	case NumberOne
	case NumberTwo
}


class Swift3EnumBugTests: XCTestCase {
	func test_Swift3_Enum_Array_Bug() {
		let enumArray: [MyEnum] = [.NumberZero, .NumberOne, .NumberZero, .NumberTwo]
		let anyObjectArray = enumArray as [AnyObject]
		let nsArray = enumArray as NSArray
		let nsObjectArray = nsArray as! [NSObject]
		
		let enumArrayElementType = type(of: enumArray[0])
		let anyObjectArrayElementType = type(of: anyObjectArray[0])
		let nsArrayElementType = type(of: nsArray[0])
		let nsObjectArrayElementType = type(of: nsObjectArray[0])
		
		print("Type of first element in enumArray: \(enumArrayElementType)")
		print("Type of first element in anyObjectArray: \(anyObjectArrayElementType)")
		print("Type of first element in nsArray: \(nsArrayElementType)")
		print("Type of first element in nsObjectArray: \(nsObjectArrayElementType)")
		
		XCTAssert(enumArrayElementType == anyObjectArrayElementType, "The types should be equal")
		XCTAssert(enumArrayElementType == nsArrayElementType, "The types should be equal")
		XCTAssert(enumArrayElementType == nsObjectArrayElementType, "The types should be equal")
	}
}
