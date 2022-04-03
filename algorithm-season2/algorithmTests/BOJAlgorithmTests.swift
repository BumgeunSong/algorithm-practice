//
//  BOJAlgorithmTests.swift
//  algorithmTests
//
//  Created by Bumgeun Song on 2022/04/01.
//

import XCTest

class BOJAlgorithmTests: XCTestCase {
    
    func testSumOfPrice() {
        let result = getMinPrices(prices: [10, 15, 20, 25], discounts: [
            0: [(1, -20), (2, -10)], 1: [], 2: [(3, -10)], 3: [(1, -10)]
        ])
        XCTAssertEqual(result, 36)
    }
    
    
    func testRead() {
        
        let n = Int(readLine()!)!
        
        var prices = [0] + readLine()!.components(separatedBy: " ").map { Int($0)! }
        
        var discounts = [Int: [[Int]]]()
        
        for i in 0..<n {
            let p1 = Int(readLine()!)!
            for _ in 0..<p1 {
                let lineArr = readLine()!.components(separatedBy: " ").map { Int($0)! }
                discounts[i+1, default: [[Int]]()] += [lineArr]
            }
        }
        
        print("discounts", discounts)
        print("prices", prices)
        
        potion(prices: prices, discounts: discounts)
    }
    
    func testPaste() {

        func plus(lhs: Int, rhs: Int) -> Int {
            let digits = String(rhs).count
            return lhs * Int(pow(Double(10), Double(digits))) + rhs
        }

        func paste(_ root: Int, sum: Int, target: Int, visited: [Bool]) -> Int {
            let sum = plus(lhs: sum, rhs: door[root-1])
            if root == target { return sum }

            var visited = visited
            visited[root] = true

            let toVisit = graph[root].filter { node in
                                              !visited[node]
                                             }

            if toVisit.isEmpty { return 0 }

            return toVisit.reduce(0) { partialResult, node in
                                      return partialResult + paste(node, sum: sum, target: target, visited: visited)
                                     }
        }

                let lineArr = readLine()!.components(separatedBy: " ").map { Int($0)! }
                let n = lineArr[0]
                let q = lineArr[1]
                let door = readLine()!.components(separatedBy: " ").map { Int($0)! }
                
                let visited = Array(repeating: false, count: n+1)
                var graph = Array(repeating: [Int](), count: n+1)
                
                for _ in 0..<n-1 {
                    let lineArr = readLine()!.components(separatedBy: " ").map { Int($0)! }
                    let node = lineArr[0]
                    let toNode = lineArr[1]
                    graph[node].append(toNode)
                    graph[toNode].append(node)
                }

                var roots = [Int]()
                var targets = [Int]()
                for _ in 0..<q {
                    let lineArr = readLine()!.components(separatedBy: " ").map { Int($0)! }
                    roots.append(lineArr[0])
                    targets.append(lineArr[1])
                    
                }
                
                for i in 0..<roots.count {
                    print(paste(roots[i], sum: 0, target: targets[i], visited: visited) % 1000000007)
                }
    }
}
