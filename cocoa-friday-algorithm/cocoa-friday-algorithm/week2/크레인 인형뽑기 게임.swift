//
//  크레인 인형뽑기 게임.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/11.
//

import Foundation

func craneGame(_ board:[[Int]], _ moves:[Int]) -> Int {
    var dollArray: [Int] = []
    var result = 0
    var newBoard = board
    
    for move in moves {
        var doll = 0
        for row in 0...newBoard.count - 1 {
            if newBoard[row][move - 1] != 0 {
                doll = newBoard[row][move - 1]
                newBoard[row][move - 1] = 0
                break
            }
        }
        if doll == 0 {
            continue
        }
        
        if dollArray.isEmpty {
            dollArray.append(doll)
        } else {
            if dollArray.last == doll {
                result += 2
                dollArray = dollArray.dropLast()
            } else {
                dollArray.append(doll)
            }
        }
    }
    print(dollArray)
    return result
}
