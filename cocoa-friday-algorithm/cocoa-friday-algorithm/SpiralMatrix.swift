//
//  SpiralMatrix.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/21.
//

import Foundation

func generateSprialMatrix(_ n: Int) -> [[Int]] {
    var spiralOrder = [(x: 0,y: 0)]
    for _ in 0..<n-1 {
        if var last = spiralOrder.last {
            last.x += 1
            spiralOrder.append(last)
        }
    }
    
    for i in 1..<n {
        
        if i % 2 == 1 {
            for _ in 0..<n-i {
                if var last = spiralOrder.last {
                    last.y += 1
                    spiralOrder.append(last)
                }
            }
            for _ in 0..<n-i {
                if var last = spiralOrder.last {
                    last.x -= 1
                    spiralOrder.append(last)
                }
            }
        } else {
            for _ in 0..<n-i {
                if var last = spiralOrder.last {
                    last.y -= 1
                    spiralOrder.append(last)
                }
            }
            for _ in 0..<n-i {
                if var last = spiralOrder.last {
                    last.x += 1
                    spiralOrder.append(last)
                }
            }
        }
        
    }
    
    var answer = Array(repeating: Array(repeating: 0, count: n), count: n)
    for (i, pos) in spiralOrder.enumerated() {
        answer[pos.y][pos.x] = i + 1
    }
    return answer
}
