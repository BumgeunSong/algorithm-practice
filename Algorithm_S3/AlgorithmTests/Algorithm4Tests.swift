//
//  Algorithm4Tests.swift
//  AlgorithmTests
//
//  Created by Bumgeun Song on 2022/05/26.
//

import XCTest

class Algorithm4Tests: XCTestCase {
    func testPermutation() throws {
        let input1 = [1,2,3,4]
        let input2 = 4
        print(permutation(nums: input1, sum: input2))
        
    }
    
    func testVerticalPermutation() throws {
        let input1 = permutation(nums: [1,2,3,4], sum: 4)
        let input2 = 2
        print(verticalPermutation(rows: input1, n: input2))
    }
    
    func testTotalCase() throws {
        let m = 5
        let n = 2
        let totalCases: [Int] = (1...m).map { 가로 in
            totalCase(가로: 가로, 높이: n)
        }
        print(totalCases)
    }
}
