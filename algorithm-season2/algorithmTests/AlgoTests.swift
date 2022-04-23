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
    
    func testTrainingSuit() throws {
        let input1 = 5
        let input2 = [2,4]
        let input3 = [3]
        let answer = 4
        
        XCTAssertEqual(trainingSuit(input1, input2, input3), answer)
    }
    
    func testLargeNumber() throws {
        let input1 = "1924"
        let input2 = 2
        let answer = "94"
        
        XCTAssertEqual(getLargeNumber(input1, input2), answer)
    }
    
    func testLargeNumber2() throws {
        let input1 = "1231234"
        let input2 = 3
        let answer = "3234"
        
        XCTAssertEqual(getLargeNumber(input1, input2), answer)
    }
    
    func testLargeNumber3() throws {
        let input1 = "4177252841"
        let input2 = 4
        let answer = "775841"
        
        XCTAssertEqual(getLargeNumber(input1, input2), answer)
    }
    
    func testMakePrimeNumber() throws {
        let input1 = [1,2,3,4]
        let answer = 1
        
        XCTAssertEqual(makePrimeNumber(input1), answer)
    }
    
    func testMakePrimeNumber2() throws {
        let input1 = [1,2,7,6,4]
        let answer = 4
        
        XCTAssertEqual(makePrimeNumber(input1), answer)
    }
    
    func testSubset() throws {
        let input1 = [1,2,2]
        print(subsetsWitDup(input1))
        XCTAssertEqual([[],[1],[1,2],[1,2,2],[2],[2,2]], subsetsWitDup(input1))
    }
    
    func testGetCombination() throws {
        let input1 = [1,2,3]
        let input2 = 2
        let answer = [[1,2],[2,3],[3,1]]
        
        XCTAssertEqual(getCombination(input1, k: input2), answer)
    }
    
    func testGetCombinationSum() throws {
        let input1 = [1,2,3]
        
        print(getCombinationSum(input1, 2))
    }
    
    func testPermute() throws {
        let input1 = [1,2,3]
        let answer = [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
        
        XCTAssertEqual(permute(input1), answer)
    }
    
    func testPermute2() throws {
        let input1 = [2,2,1,1]
        let answer = [[1,1,2,2],[1,2,1,2],[1,2,2,1],[2,1,1,2],[2,1,2,1],[2,2,1,1]]
        
        XCTAssertEqual(permute2(input1), answer)
    }
    
    func testGetMaxRepeat() throws {
        let input1 = ["abca","bcab","cabc", "dede", "dede" , "dede"]
        
        let result = compressString(input1)
        XCTAssertEqual(result, "abcabcabcabc3dede")
    }
    
    func testStringCompression() throws {
        let input1 = "aabbaccc"
        let answer = 7
        
        XCTAssertEqual(stringCompression(input1), answer)
    }
    
    func testStringCompression2() throws {
        let input1 = "xababcdcdababcdcd"
        let answer = 17
        
        XCTAssertEqual(stringCompression(input1), answer)
    }
    
    func testStringCompression3() throws {
        let input1 = "abcabcabcabcdededededede"
        let answer = 14
        
        XCTAssertEqual(stringCompression(input1), answer)
    }
}
