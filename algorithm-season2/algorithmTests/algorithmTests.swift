//
//  algorithmTests.swift
//  algorithmTests
//
//  Created by Bumgeun Song on 2022/03/18.
//

import XCTest

class algorithmTests: XCTestCase {

    func testExample() throws {
        XCTAssertEqual(printHello(), "Hello, World!")
    }
    
    func testMaxSubArray() throws {
        var nums = [-2,1,-3,4,-1,2,1,-5,4]
        XCTAssertEqual(Array.maxSubArray(nums), 6)
        
        nums = [1]
        XCTAssertEqual(Array.maxSubArray(nums), 1)
        
        nums = [5,4,-1,7,8]
        XCTAssertEqual(Array.maxSubArray(nums), 23)
        
    }
    
    func testMergeSortedArray1() throws {
        var nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
        Array.merge(&nums1, m, nums2, n)
        XCTAssertEqual(nums1, [1,2,2,3,5,6])
    }
    
    func testMergeSortedArray2() throws {
        var nums1 = [1], m = 1, nums2 = [Int](), n = 0
        Array.merge(&nums1, m, nums2, n)
        XCTAssertEqual(nums1, [1])
    }
    
    func testMergeSortedArray3() throws {
        var nums1 = [1], m = 1, nums2 = [Int](), n = 0
        Array.merge(&nums1, m, nums2, n)
        XCTAssertEqual(nums1, [1])
    }
}
