//
//  algorithmTests.swift
//  algorithmTests
//
//  Created by Bumgeun Song on 2022/03/18.
//

import XCTest

class algorithmTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        XCTAssertEqual(printHello(), "Hello, World!")
    }
    
    func testMaxSubArray() throws {
        var nums = [-2,1,-3,4,-1,2,1,-5,4]
        XCTAssertEqual(Array.maxSubArray(nums), 0)
        
        nums = [1]
        XCTAssertEqual(Array.maxSubArray(nums), 1)
        
        nums = [5,4,-1,7,8]
        XCTAssertEqual(Array.maxSubArray(nums), 23)
        
        nums = [-5,-4,-1,-7,-8]
        XCTAssertEqual(Array.maxSubArray(nums), -1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
