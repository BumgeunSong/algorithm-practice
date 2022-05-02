//
//  AlgorithmTests.swift
//  AlgorithmTests
//
//  Created by Bumgeun Song on 2022/05/02.
//

import XCTest

class AlgorithmTests: XCTestCase {
    
    func testEditTable1() throws {
        let input1 = 10
        let answer = "OOOOOOOOOO"
        
        XCTAssertEqual(LinkedList(n: input1).description, answer)
    }
    
    func testEditTable2() throws {
        let input1 = 8
        let input2 = 2
        let answer = "OOXOOOOO"
        
        let list = LinkedList(n: input1)
        list.setPointer(to: input2)
        
    }
    
    func testEditTable3() throws {
        let input1 = 8
        let input2 = 2
        let input3 = ["D 2","C","U 3","C","D 4","C","U 2","Z","Z","U 1","C"]
        let answer = "OOXOXOOO"
        
        let result = editTable(8, 2, input3)
        XCTAssertEqual(result, answer)
    }
    


}
