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
    
    func testGeneric() throws {
        func decodeFactory<T>(_ t: T, number: Int) {
            print(type(of: T.self))
            print(MemoryLayout.size(ofValue: t))
        }
        let decodable = CGRect(x: 1, y: 1, width: 1, height: 1) as! Decodable
        print(MemoryLayout.size(ofValue: CGRect(x: 1, y: 1, width: 1, height: 1) as! Decodable))
        print(MemoryLayout.size(ofValue: ["String", "2", "3", "4"]))
    }
    
    func testEveryCity1() throws {
        let input1 = [["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]
        let answer = ["ICN", "JFK", "HND", "IAD"]
        
        XCTAssertEqual(everyCity(input1), answer)
    }
    
    func testEveryCity2() throws {
        let input1 = [["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]
        let answer = ["ICN", "ATL", "ICN", "SFO", "ATL", "SFO"]

        
        XCTAssertEqual(everyCity(input1), answer)
    }
    
    func testConnectIslands() throws {
        let input1 = 4
        let input2 = [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]]    
        let answer = 4
        
        XCTAssertEqual(connectIslands(input1, input2), answer)
    }
    
    
}
