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
    
    func testTwoSum() throws {
        var nums = [2,7,11,15], target = 9
        let result1 = Array.twoSum(nums, target)
        XCTAssertEqual(result1, [0,1])
        
        nums = [3,2,4]
        target = 6
        let result2 = Array.twoSum(nums, target)
        XCTAssertEqual(result2, [1,2])
        
        nums = [3,3]
        target = 6
        let result3 = Array.twoSum(nums, target)
        XCTAssertEqual(result3, [0,1])
    }
    
    func testIntersect() throws {
        var nums1 = [1,2,2,1], nums2 = [2,2]
        let result1 = Array.intersect(nums1, nums2)
        XCTAssertEqual(result1, [2,2])
        
        nums1 = [4,9,5]
        nums2 = [9,4,9,8,4]
        let result2 = Array.intersect(nums1, nums2)
        XCTAssertEqual(result2, [4,9])
    }
    
    func testMaxProfit() throws {
        let inputs = [
            [7,1,5,3,6,4],
            [7,6,4,3,1]
        ]
        
        let output = inputs.map { prices in
            Array.maxProfit(prices)
        }
        
        XCTAssertEqual(output,
                       [5, 0])
    }
    
//    func testTemplate() throws {
//        let inputs = [
//            [7],
//            [7]
//        ]
//        let output = inputs.map { prices in
//            Array.maxProfit(prices)
//        }
//
//        XCTAssertEqual(output, [])
//    }
}
