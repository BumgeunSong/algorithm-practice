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
    
    func testBalancedSum() throws {
        let input1 = [1,2,3,3]
        let answer = 2
        
        XCTAssertEqual(balancedSum(arr: input1), answer)
    }
    
    func testisPossible() throws {
        
        let answer = "NO"
        
        XCTAssertEqual(isPossible(a: 1, b: 2, c: 3, d: 6), answer)
    }
    
    func testisPossible2() throws {
        
        let answer = "YES"
        
        XCTAssertEqual(isPossible(a: 1, b: 4, c: 5, d: 9), answer)
    }
    func testMinimumBribes() throws {
        let input1 = [1, 2, 5, 3, 7, 8, 6, 4]
        print(minimumBribes(q: input1))
    }
}
