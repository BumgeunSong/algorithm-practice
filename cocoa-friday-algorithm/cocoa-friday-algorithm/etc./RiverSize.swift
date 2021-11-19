//
//  RiverSize.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/19.
//

import Foundation

func riverSizes(_ matrix: [[Int]]) -> [Int] {
    var newMatrix = matrix
    var result: [Int] = []
    for row in newMatrix {
        print(row)
    }
    for Y in 0..<newMatrix.count {
        for X in 0..<newMatrix[0].count {
            if newMatrix[Y][X] == 1 {
                let root = [Y, X]
                var unvisitedQueue: [[Int]] = []
                unvisitedQueue.append(root)
                
                var size = 0
                
                repeat {
                    let y = unvisitedQueue.last![0]
                    let x = unvisitedQueue.last![1]
                    
                    size += 1
                    newMatrix[y][x] = 0
                    print("unvisitedQueue", unvisitedQueue)
                    unvisitedQueue.removeLast()
                    
                    if x > 0 && newMatrix[y][x - 1] == 1 {
                        unvisitedQueue.append([y, x - 1])
                    }
                    if x < newMatrix[0].count - 1 && newMatrix[y][x + 1] == 1 {
                        unvisitedQueue.append([y, x + 1])
                    }
                    if y > 0 && newMatrix[y-1][x] == 1 {
                        unvisitedQueue.append([y - 1, x])
                    }
                    if y < newMatrix.count - 1 && newMatrix[y + 1][x] == 1 {
                        unvisitedQueue.append([y + 1, x])
                    }
                    
                } while unvisitedQueue.count != 0
                print("size: \(size)")
                print("graph")
                for row in newMatrix {
                    print(row)
                }
                result.append(size)
            }
        }
    }
    return result
}
