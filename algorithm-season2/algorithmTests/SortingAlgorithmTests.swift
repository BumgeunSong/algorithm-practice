//
//  SortingAlgorithmTests.swift
//  algorithmTests
//
//  Created by Bumgeun Song on 2022/03/26.
//

import XCTest

class SortingAlgorithmTests: XCTestCase {
    func testMergeSort() throws {
        XCTAssertEqual(
            Sorting.mergeSort([2,6,7,8,3,4,9,1]),
            [1,2,3,4,6,7,8,9])
    }
    
    func testMergeSortedArray() throws {
        let nums1 = [1,2,3]
        let nums2 = [2,5,6]
        let result = Sorting.mergeSortedArray(nums1, nums2)
        XCTAssertEqual(result, [1,2,2,3,5,6])
    }
    
    
}
