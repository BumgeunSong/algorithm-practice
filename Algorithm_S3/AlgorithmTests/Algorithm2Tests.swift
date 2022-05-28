//
//  Algorithm2Tests.swift
//  AlgorithmTests
//
//  Created by Bumgeun Song on 2022/05/04.
//

import XCTest

class Algorithm2Tests: XCTestCase {
    
    func testMaximize() throws {
        let input1 = "100-200*300-500+20"
        let answer = Int64(60420)
        
        XCTAssertEqual(maximizeEquation(input1), answer)
    }
    
    func testCalculate() throws {
        XCTAssertEqual(calculate(40, 50, "+"), 90)
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
    
    
    func testRankSearch() throws {
        let input1 = ["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"]
        let input2 = ["java and backend and junior and pizza 100","python and - and senior and chicken 50","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]
        let answer = [1,3,1,1,2,4]
        
        XCTAssertEqual(rankSearch(input1, input2), answer)
    }
    
    func testQuery() throws {
        let input1 = "java and backend and junior and pizza 100"
        let info = ["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"]
        
        var table: [String: Set<Int>] = [
            "java": Set<Int>(),
            "cpp": Set<Int>(),
            "python": Set<Int>(),
            "backend": Set<Int>(),
            "frontend": Set<Int>(),
            "junior": Set<Int>(),
            "senior": Set<Int>(),
            "chicken": Set<Int>(),
            "pizza": Set<Int>()
        ]
        var scoreTable: [Int: Int] = [:]
        
        for index in 0..<info.count {
            var dataArr = info[index].components(separatedBy: " ")
            let score = Int(dataArr.removeLast())!
            scoreTable[index] = score
            
            for string in dataArr {
                table[string]!.insert(index)
            }
        }
        
        func query(query: String) -> Int {
            var queryArr = query.components(separatedBy: " ")
            let score = Int(queryArr.removeLast())!
            let filteredQuery = queryArr.filter {
                $0 != "-" && $0 != "and"
            }
            
            var result = table[filteredQuery[0]]!
            for query in filteredQuery {
                result = result.intersection(table[query]!)
                if result.isEmpty { break }
            }
            
            print(result)
            print(score)
            return result.filter { scoreTable[$0]! >= score }.count
        }
        
        print(query(query: input1))
        
    }
    
    func testGenerateKeys() throws {
        let input = ["java", "backend", "junior", "pizza"]
        print(generateKeys(info: input))
    }
    
    func testParseQueery() throws {
        let input1 = "- and - and - and - 150"
        
        
        print(parseQuery(input1))
    }
    
    func testBinarySearchCount() throws {
        let input1 = [7, 7, 7, 7, 100]
        let target = 100
        let answer = 1
        
        XCTAssertEqual(binarySearchCount(input1, target: target), answer)
    }
    
}
