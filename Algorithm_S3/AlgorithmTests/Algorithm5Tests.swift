//
//  Algorithm5Tests.swift
//  AlgorithmTests
//
//  Created by Bumgeun Song on 2022/06/12.
//

import XCTest

class Algorithm5Tests: XCTestCase {
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func test_sorting_1() throws {
        let input1 = [1,2,3,4,5,6,7,8,9]
        let answer = [0,0,0,0,0,0,0,0,0]
        
        XCTAssertEqual(sorting(input1), answer)
    }
    
    func test_vip_1() throws {
        let input1 = [20,23,24]
        let input2 = [
            [100_000, 100_000, 100_000, 100_000,
             100_000, 100_000, 100_000, 100_000,
             100_000, 100_000,100_000, 100_000],
            [100_000, 100_000,100_000, 100_000,
             100_000, 100_000,100_000, 100_000,
             100_000, 100_000,100_000, 100_000],
            [350_000, 50_000, 50_000, 50_000,
             50_000, 50_000, 50_000, 50_000,
             50_000, 50_000, 50_000, 50_000,],
        ]
        let estimates = [
            100_000,
            100_000,
            100_000
        ]
        let answer = [1,1]
        
        XCTAssertEqual(vip(input1, input2, estimates), answer)
    }
    
    func test_subset_1() throws {
        print(makeSubsets([6,8,10,12,16,17]))
        
    }
    
    func test_upper_Bound() throws {
        let input1 = [100, 500, 2000]
        let input2 = 1500
        let answer = 1
        print(upperBound(input1, target: input2))
    }
    
    func test_planSearch_1() throws {
        let input1 = ["100 1 3", "500 4", "2000 5"]
        let input2 = ["300 3 5", "1500 1", "100 1 3", "50 1 2"]
        let answer = [3,3,1,0]
        
        XCTAssertEqual(planSearch(5, input1, input2), answer)
    }
    
    func test_planSearch_2() throws {
        let input1 = ["38 2 3", "394 1 4"]
        let input2 = ["10 2 3", "300 1 2 3 4", "500 1"]
        let answer = [1,2,0]
        
        XCTAssertEqual(planSearch(4, input1, input2), answer)
    }
    
    func test_야영_1() throws {
        let input1 = ["..FF", "###F", "###."]
        let input2 = 4
        let answer = 1
        
        XCTAssertEqual(야영(input1, input2), answer)
    }
    
    func test_letterCombination_1() throws {
        let input1 = "23"
        let answer = ["ad","ae","af","bd","be","bf","cd","ce","cf"]
        
        XCTAssertEqual(letterCombinations(input1), answer)
    }
    
    func test_wordSearch_1() throws {
        let input1: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
        let input2 = Array("ABCCED")
        let visited = Array(repeating: Array(repeating: false, count: input1[0].count), count: input1.count)
        let answer = true
        
        XCTAssertEqual(dfs((0,0), input2, input1, visited), answer)
    }
    
    func test_wordSearch_2() throws {
        let input1: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
        let input2 = "SEE"
        let answer = true
        
        XCTAssertEqual(exist(input1, input2), answer)
    }
    
    func test_wordSearch_3() throws {
        let input1: [[Character]]  = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
        let input2 = "ABCB"
        let answer = false
        
        XCTAssertEqual(exist(input1, input2), answer)
    }
    
    func test_wordSearch_4() throws {
        let input1: [[Character]] = [["a","b"],["c","d"]]
        let input2 = "acdb"
        let answer = true
        
        XCTAssertEqual(exist(input1, input2), answer)
    }
    
    func test_topKFrequent_1() throws {
        let input1 = [1,1,1,2,2,3]
        let input2 = 2
        let answer = [1,2]
        
        XCTAssertEqual(topKFrequent(input1, input2), answer)
    }
    
    func test_topKFrequent_2() throws {
        let input1 = [1]
        let input2 = 1
        let answer = [1]
        
        XCTAssertEqual(topKFrequent(input1, input2), answer)
    }
    
    func test_quickSelect_2() throws {
        let input1 = [3,5,7,1,2,4,6]
        let input2 = 5
        let answer = 5
        
        XCTAssertEqual(quickSelect_smallest(input1, input2), answer)
    }
    
    func test_quickSelect_3() throws {
        let input1 = [3,5,7,1,2,4,6]
        let input2 = 6
        let answer = 2
        
        XCTAssertEqual(quickSelect_largest(input1, input2), answer)
    }
    
    func test_searchRange_1() throws {
        let input1 = [5,7,7,8,8,10]
        let input2 = 8
        let answer = [3,4]
        
        XCTAssertEqual(searchRange(input1, input2), answer)
    }
    
    func test_searchRange_2() throws {
        let input1 = [5,7,7,8,8,10]
        let input2 = 6
        let answer = [-1, -1]
        
        XCTAssertEqual(searchRange(input1, input2), answer)
    }
    
    func test_searchRange_3() throws {
        let input1 = [Int]()
        let input2 = 0
        let answer = [-1, -1]
        
        XCTAssertEqual(searchRange(input1, input2), answer)
    }
    
    func test_searchRange_4() throws {
        let input1 = [2,2]
        let input2 = 2
        let answer = [0, 1]
        
        XCTAssertEqual(searchRange(input1, input2), answer)
    }
    
    func test_searchRange_5() throws {
        let input1 = [2,2]
        let input2 = 1
        let answer = [-1, -1]
        
        XCTAssertEqual(searchRange(input1, input2), answer)
    }
    
    func test_searchMatrix_1() throws {
        let input1 = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]
        let input2 = 5
        let answer = true
        
        XCTAssertEqual(searchMatrix(input1, input2), answer)
    }
    
    func test_searchMatrix_2() throws {
        let input1 = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]
        let input2 = 20
        let answer = false
        
        XCTAssertEqual(searchMatrix(input1, input2), answer)
    }
    
    func test_peak_1() throws {
        let input1 = [1,2,1,3,5,6,4]
        let answer = 1
        
        XCTAssertEqual(findPeakElement(input1), answer)
    }
    
    func test_peak_2() throws {
        let input1 = [1,2,3,1]
        let answer = 2
        
        XCTAssertEqual(findPeakElement(input1), answer)
    }
    
    func test_peak_3() throws {
        let input1 = [1]
        let answer = 0
        
        XCTAssertEqual(findPeakElement(input1), answer)
    }
    
    func test_peak_4() throws {
        let input1 = [2,1]
        let answer = 0
        
        XCTAssertEqual(findPeakElement(input1), answer)
    }
}
