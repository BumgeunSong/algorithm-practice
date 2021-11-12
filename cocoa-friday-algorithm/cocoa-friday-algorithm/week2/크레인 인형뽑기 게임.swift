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
    
    // Time Complexity : O(n x m)
    // n은 moves 배열의 길이, m은 board 배열의 길이
    
    for move in moves {
        var doll = 0
        // 놓쳤던 point 1. for row in Board 사용시 row는 새롭게 생성된 값이며 Board를 변화시키지 않음.
        // 놓쳤던 point 2. move는 1부터 시작하므로 zero-indexed로 변환해야 함
        for row in 0...newBoard.count - 1 {
            if newBoard[row][move - 1] != 0 {
                doll = newBoard[row][move - 1]
                newBoard[row][move - 1] = 0
                break
            }
        }
        
        // 놓쳤던 point 3. 해당 move에 아무 인형도 없을 경우 처리
        if doll == 0 {
            continue
        }
        
        if dollArray.isEmpty {
            // 놓쳤던 point 4. 비어있는 경우에도 인형은 추가해줘야 함.
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
    
    return result
}
