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
}
