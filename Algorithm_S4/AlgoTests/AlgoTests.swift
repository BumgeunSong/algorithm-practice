//
//  AlgoTests.swift
//  AlgoTests
//
//  Created by Bumgeun Song on 2022/07/30.
//

import XCTest

class AlgoTests: XCTestCase {
    
    func test_RunningSum_1() throws {
        let input1 = [1,2,3,4]
        let answer = [1,3,6,10]
        
        XCTAssertEqual(runningSum(input1), answer)
    }
    
    func test_pivotIndex_1() throws {
        let input1 = [1,7,3,6,5,6]
        let answer = 3
        
        XCTAssertEqual(pivotIndex(input1), answer)
    }
    
    func test_isomorphic_1() throws {
        let input1 = "egg"
        let input2 = "add"
        let answer = true
        
        XCTAssertEqual(isIsomorphic(input1, input2), answer)
    }
    
    func test_isomorphic_2() throws {
        let input1 = "foo"
        let input2 = "bar"
        let answer = false
        
        XCTAssertEqual(isIsomorphic(input1, input2), answer)
    }
    
    func test_subsequence_1() throws {
        let input1 = "abc"
        let input2 = "ahbgdc"
        let answer = true
        
        XCTAssertEqual(isSubsequence(input1, input2), answer)
    }
    
    func test_subsequence_2() throws {
        let input1 = "axc"
        let input2 = "ahbgdc"
        let answer = false
        
        XCTAssertEqual(isSubsequence(input1, input2), answer)
    }
    
    func test_mergeLists_1() throws {
        let input1 = ListNode(1, ListNode(2, ListNode(4)))
        let input2 = ListNode(1, ListNode(3, ListNode(4)))
        let answer = ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(4))))))
        
        XCTAssertEqual(mergeTwoLists(input1, input2)?.values, answer.values)
    }
    
    func test_mergeLists_2() throws {
        let input1 = ListNode(0)
        let input2: ListNode? = nil
        let answer = ListNode(0)
        
        XCTAssertEqual(mergeTwoLists(input1, input2)?.values, answer.values)
    }
    
    func test_maxProfit_1() throws {
        let input1 = [7,1,5,3,6,4]
        let answer = 5
        
        XCTAssertEqual(maxProfit(input1), answer)
    }
    
    func test_maxProfit_2() throws {
        let input1 = [7,6,4,3,1]
        let answer = 0
        
        XCTAssertEqual(maxProfit(input1), answer)
    }
}
