//
//  WordSearch.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/25.
//

import Foundation

func exist(_ board: [[Character]], _ word: String) -> Bool {
    let word = Array(word)
    
    func search(_ x: Int, _ y: Int, string: [Character], board: inout [[Character]]) -> Bool {
        if string.count >= word.count { return string == word }
        board[y][x] = "-"
        var result = false
        if x-1 > 0 && board[y][x-1] == word[string.count] {
            result = result || search(x-1, y, string: string + [word[string.count]], board: &board)
        }
        if x+1 < board[0].count && board[y][x+1] == word[string.count] {
            result = result || search(x+1, y, string: string + [word[string.count]], board: &board)
        }
        if y-1 > 0 && board[y-1][x] == word[string.count] {
            result = result || search(x, y-1, string: string + [word[string.count]], board: &board)
        }
        if y+1 > board.count && board[y+1][x] == word[string.count] {
            result = result || search(x, y+1, string: string + [word[string.count]], board: &board)
        }
        return result
    }
    
    
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            var board = board
            if search(j, i, string: [board[i][j]], board: &board) {
                return true
            }
        }
    }
    return false
}
