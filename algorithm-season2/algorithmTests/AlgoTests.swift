//
//  AlgoTests.swift
//  algorithmTests
//
//  Created by Bumgeun Song on 2022/04/06.
//

import XCTest

class AlgoTests: XCTestCase {
    
    func testTargetNumber1() throws {
        let input1 = [1,1,1,1,1]
        let input2 = 3
        let answer =
        
        XCTAssertEqual(targetNumber(input1, input2), 5)
    }
    
    func testTargetNumber2() throws {
        let input1 = [4,1,2,1]
        let input2 = 4
        let answer = 2
        
        XCTAssertEqual(targetNumber(input1, input2), answer)
    }
    
    func testNumOfNetwork1() throws {
        let input1 = 3
        let input2 = [[1,1,0],[1,1,0],[0,0,1]]
        let answer = 2
        
        XCTAssertEqual(numOfNetwork(input1, input2), answer)
    }
    
    func testNumOfNetwork2() throws {
        let input1 = 3
        let input2 = [[1, 1, 0], [1, 1, 1], [0, 1, 1]]
        let answer = 1
        
        XCTAssertEqual(numOfNetwork(input1, input2), answer)
    }
    
    func testWordChange() throws {
        let input1 = "hit"
        let input2 = "cog"
        let input3 = ["hot", "dot", "dog", "lot", "log", "cog"]
        let answer = 4
        
        XCTAssertEqual(wordChange(input1, input2, input3), answer)
    }
    
    func testWordChange2() throws {
        let input1 = "hit"
        let input2 = "cog"
        let input3 = ["hot", "dot", "dog", "lot", "log"]
        let answer = 0
        
        XCTAssertEqual(wordChange(input1, input2, input3), answer)
    }
    
    func testTodayHouse2() throws {
        let input1 = "{a} {b} {c} {d} {i}"
        let input2 = [
            ["b", "{c}"],
            ["a", "{b}"],
            ["e", "{f}"],
            ["h", "i"],
            ["d", "{e}"],
            ["f", "{d}"],
            ["c", "d"]
        ]
        let answer = "d d d {d} {i}"
        
        XCTAssertEqual(todayHouse2(input1, input2), answer)
    }
    
}
