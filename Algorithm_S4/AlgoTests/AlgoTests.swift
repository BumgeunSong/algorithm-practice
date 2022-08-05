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
    
    func test_LongestPalindrome_1() throws {
        let input1 = "abccccdd"
        let answer = 7
        
        XCTAssertEqual(longestPalindrome(input1), answer)
    }
    
    func test_LongestPalindrome_2() throws {
        let input1 = "a"
        let answer = 1
        
        XCTAssertEqual(longestPalindrome(input1), answer)
    }
    
    
    func test_insertIntervals_1() throws {
        let input1 = [[1,2], [3,5], [6,7], [8,10], [12, 16]]
        let input2 = [4,8]
        let answer = [[1,2], [3,10], [12,16]]
        
        XCTAssertEqual(insert(input1, input2), answer)
    }
    
    func test_insertIntervals_2() throws {
        let input1 = [[1,3],[6,9]]
        let input2 = [2,5]
        let answer = [[1,5], [6,9]]
        
        XCTAssertEqual(insert(input1, input2), answer)
    }
    
    func test_insertIntervals_3() throws {
        let input1 = [[1,5]]
        let input2 = [1,7]
        let answer = [[1,7]]
        
        XCTAssertEqual(insert(input1, input2), answer)
    }
    
    func test_updateMatrix_1() throws {
        let input1 = [[0,0,0],[0,1,0],[0,0,0]]
        let answer = [[0,0,0],[0,1,0],[0,0,0]]
        
        XCTAssertEqual(updateMatrix(input1), answer)
    }
    
    func test_updateMatrix_2() throws {
        let input1 = [[0,0,0],[0,1,0],[1,1,1]]
        let answer = [[0,0,0],[0,1,0],[1,2,1]]
        
        XCTAssertEqual(updateMatrix(input1), answer)
    }
    
    func test_updateMatrix_3() throws {
        let input1 = [[0,1,0,1,1],[1,1,0,0,1],[0,0,0,1,0],[1,0,1,1,1],[1,0,0,0,1]]
        let answer =
        [[0,1,0,1,2],[1,1,0,0,1],[0,0,0,1,0],[1,0,1,1,1],[1,0,0,0,1]]
        
        XCTAssertEqual(updateMatrix(input1), answer)
    }
    
    func test_longestSubstring_1() throws {
        let input1 = "abcabcbb"
        let answer = 3
        
        XCTAssertEqual(lengthOfLongestSubstring(input1), answer)
    }
    
    func test_longestSubstring_2() throws {
        let input1 = "abcdefghijklmnopqrstuvwxyz"
        let answer = 26
        
        XCTAssertEqual(lengthOfLongestSubstring(input1), answer)
    }
    
    func test_3sum_1() throws {
        let input1 = [-1,0,1,2,-1,-4]
        let answer = [[-1,-1,2],[-1,0,1]]
        
        XCTAssertEqual(threeSum(input1), answer)
    }
    
    func test_3sum_2() throws {
        let input1 = [0,1,1]

        let answer = [[Int]]()
        
        XCTAssertEqual(threeSum(input1), answer)
    }
    
    func test_3sum_3() throws {
        let input1 = [0,0,0]

        let answer = [[0,0,0]]
        
        XCTAssertEqual(threeSum(input1), answer)
    }
    
    func test_Trie_1() throws {
        
        let trie = Trie()
        trie.insert("apple")
        XCTAssertTrue(trie.search("apple"))
        XCTAssertTrue(trie.startsWith("app"))
        XCTAssertFalse(trie.search("app"))
        
    }
    
    func test_coinChange_1() throws {
        let input1 = [1,2,5]
        let input2 = 11

        let answer = 3
        
        XCTAssertEqual(coinChange(input1, input2), answer)
    }
    
    func test_coinChange_2() throws {
        let input1 = [1]
        let input2 = 0

        let answer = 0
        
        XCTAssertEqual(coinChange(input1, input2), answer)
    }
    
    func test_coinChange_3() throws {
        let input1 = [186,419,83,408]
        let input2 = 6249

        let answer = 20
        
        XCTAssertEqual(coinChange(input1, input2), answer)
    }
    
    func test_productExceptSelf_3() throws {
        let input1 = [1,2,3,4]
        let answer = [24,12,8,6]
        
        XCTAssertEqual(productExceptSelf(input1), answer)
    }
    
    func test_productExceptSelf_2() throws {
        let input1 = [-1,1,0,-3,3]
        let answer = [0,0,9,0,0]
        
        XCTAssertEqual(productExceptSelf(input1), answer)
    }

    
    func test_searchRotated_1() throws {
        let input1 = [4,5,6,7,0,1,2]
        let input2 = 0
        let answer = 4
        
        XCTAssertEqual(search(input1, input2), answer)
    }
    
    func test_searchRotated_2() throws {
        let input1 = [4,5,6,7,0,1,2]
        let input2 = 3
        let answer = -1
        
        XCTAssertEqual(search(input1, input2), answer)
    }
    
    func test_searchRotated_3() throws {
        let input1 = [5,1,3]
        let input2 = 5
        let answer = 0
        
        XCTAssertEqual(search(input1, input2), answer)
    }
    
    func test_searchRotated_4() throws {
        let input1 = [3,5,1]
        let input2 = 3
        let answer = 0
        
        XCTAssertEqual(search(input1, input2), answer)
    }
    
    
    func test_searchRotated_5() throws {
        let input1 = [5,1,3]
        let input2 = 3
        let answer = 2
        
        XCTAssertEqual(search(input1, input2), answer)
    }
    
    
    func test_searchRotated_6() throws {
        let input1 = [4,5,6,7,8,1,2,3]
        let input2 = 8
        let answer = 4
        
        XCTAssertEqual(search(input1, input2), answer)
    }
    
    func test_combiSum_1() throws {
        let input1 = [2,3,6,7]
        let input2 = 7
        let answer = [[2,2,3],[7]]
        
        XCTAssertEqual(combinationSum(input1, input2), answer)
    }
    
    func test_merge_1() throws {
        let input1 = [[1,3],[2,6],[8,10],[15,18]]
        let answer = [[1,6],[8,10],[15,18]]
        
        XCTAssertEqual(merge(input1), answer)
    }
}
