//
//  BOJAlgorithmTests.swift
//  algorithmTests
//
//  Created by Bumgeun Song on 2022/04/01.
//

import XCTest

class BOJAlgorithmTests: XCTestCase {
    
    let graph = [
        1: [[2, 3]],
        2: [[1, 3], [3, 2], [4, 4]],
        3: [[2, 2]],
        4: [[2, 4]]
    ]
    
    override func setUp() {
        
    }
    
    func testMootube() {
        
        let result1 = getNumberOfRelatedVideo(root: 2, k: 1, graph: graph)
        XCTAssertEqual(result1, 3)
        
    }
    
    func testMootube2() {
        let result2 = getNumberOfRelatedVideo(root: 1, k: 4, graph: graph)
        XCTAssertEqual(result2, 0)
        
    }
    
    func testMootube3() {
        let result3 = getNumberOfRelatedVideo(root: 1, k: 3, graph: graph)
        XCTAssertEqual(result3, 2)
    }

    func testRead() {
        read()
    }
}
