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
    for move in moves {
        var doll = 0
        for row in board {
            if row[move] != 0 {
                doll = row[move]
                row[move] = 0
                break
            }
        }
        if dollArray.isEmpty != true {
            if dollArray.last == doll {
                result += 1
                dollArray = dollArray.dropLast()
            } else {
                dollArray.append(doll)
            }
        }
    }
    return result
})
