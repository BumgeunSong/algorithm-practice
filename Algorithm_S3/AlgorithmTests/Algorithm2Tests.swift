//
//  Algorithm2Tests.swift
//  AlgorithmTests
//
//  Created by Bumgeun Song on 2022/05/04.
//

import XCTest

class Algorithm2Tests: XCTestCase {

    func testExample() throws {
       maximizeEquation("100-200*300-500+20")
    }
    
    func testMaximize() throws {
        let input1 = "100-200*300-500+20"
        let answer = Int64(60420)
        
        XCTAssertEqual(maximizeEquation(input1), answer)
    }
    
    func testCalculate() throws {
        XCTAssertEqual(calculate(40, 50, "+"), 90)
    }
    
    func testResolveAll() {
        let result = resolveAll(["*", "+", "-"], [(100,"-"),(200,"*"),(300,"-"),(500, "+"),(20, "+")])
        let answer = Int64(60420)
        XCTAssertEqual(result, answer)
    }
    
    func testTupleDict() throws {
        let input1 = "{{123}}"
        print(tupleDict(input1))
    }
    
    func testTuple() throws {
        let input1 = "{{2},{2,1},{2,1,3},{2,1,3,4}}"
        let answer = [2, 1, 3, 4]
        
        XCTAssertEqual(tuple(input1), answer)
    }
    
    func testTuple2() throws {
        let input1 = "{{123}}"
        let answer = [123]
        
        XCTAssertEqual(tuple(input1), answer)
    }


}
