//
//  Crane_kakao.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/19.
//

import Foundation

func crane(_ board:[[Int]], _ moves:[Int]) -> Int {
    var stack = [Int]()
    var disappear = 0
    var board = board
    
    for move in moves {
        var doll = 0
        for i in 0..<board.count {
            if board[i][move-1] == 0 {
                continue
            } else {
                doll = board[i][move-1]
                board[i][move-1] = 0
                break
            }
        }
        if doll == 0 { continue }
        
        if let last = stack.last, last == doll {
            stack.removeLast()
            disappear += 2
        } else {
            stack.append(doll)
        }
    }
    
    
    return disappear
}
