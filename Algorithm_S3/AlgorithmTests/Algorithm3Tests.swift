//
//  Algorithm3Tests.swift
//  AlgorithmTests
//
//  Created by Bumgeun Song on 2022/05/07.
//

import XCTest

class Algorithm3Tests: XCTestCase {

    func testExample() throws {
        XCTAssertEqual(1+1, 2)
    }

    func testSolution1() throws {
        let input1 = ["AN", "CF", "MJ", "RT", "NA"]
        let input2 = [5, 3, 2, 7, 5]
        let answer = "TCMA"
        
        XCTAssertEqual(solution1(input1, input2), answer)
    }
    
    func testSolution1_2() throws {
        let input1 = ["TR", "RT", "TR"]
        let input2 = [7, 1, 3]
        let answer = "RCJA"
        
        XCTAssertEqual(solution1(input1, input2), answer)
    }
    
    func testSolution1_3() throws {
        let input1 = ["TR", "RT", "MJ", "JM"]
        let input2 = [4, 4, 4, 4 ]
        let answer = "RCJA"
        
        XCTAssertEqual(solution1(input1, input2), answer)
    }
    
    func testSolution2_1() throws {
        let input1 = [3, 2, 7, 2]
        let input2 = [4, 6, 5, 1]
        let answer = 2
        
        XCTAssertEqual(solution2(input1, input2), answer)
    }
    
    func testSolution2_2() throws {
        let input1 = [1, 2, 1, 2]
        let input2 = [1, 10, 1, 2]
        let answer = 7
        
        XCTAssertEqual(solution2(input1, input2), answer)
    }
    
    func testSolution2_3() throws {
        let input1 = [1, 1]
        let input2 = [1, 5]
        let answer = -1
        
        XCTAssertEqual(solution2(input1, input2), answer)
    }
    
    func testSolution2_4() throws {
        let input1 = [3, 3, 3, 3]
        let input2 = [3, 3, 3, 3, 4]
        let answer = -1
        
        XCTAssertEqual(solution2(input1, input2), answer)
    }
    
    func testSolution2_5() throws {
        let input1 = [1, 1, 1, 1] // 16
        let input2 = [9, 8, 9, 8] // 18
        let answer = -1
        
        XCTAssertEqual(solution2(input1, input2), answer)
    }
    
    func testBestJump() throws {
        let input1 = [[10,4,0,4,2], [4,11,4,0,2]]
        let input2 = [[0,0,0,1,1],[0,0,1,0,1],[0,0,2,1,2],[4,5,3,1,2]]
        let answer = 2
        
        let result = bestJump(4,5, input1, input2)
        XCTAssertEqual(result, answer)
    }
    
    func testSolution3_1() throws {
        let input1 = [[0,0,2,1,2],[4,5,3,1,2],[4,11,4,0,2],[10,4,0,4,2]]
        let answer = 13
        
        let result = solution3(0,0, input1)
        XCTAssertEqual(result, answer)
    }
    
    func testSolution3_2() throws {
        let input1 = [[0,0,3,3,4]]
        let answer = 0
        
        let result = solution3(0,0, input1)
        XCTAssertEqual(result, answer)
    }
    
    func test후보키() throws {
        let input1 = [["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]
        let answer = 2
        
        XCTAssertEqual(후보키(input1), answer)
    }
    
    func testIsUnique() throws {
        let input1 = [1,2]
        let input2 = [["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]
        XCTAssertEqual(isUniqueKey(input1, input2), true)
    }
    
    func testIsMinimal() throws {
        let input1 = [0,1,2,3]
        let input2 = [["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]
        XCTAssertEqual(isMinimalKey(input1, input2), true)
    }

}
