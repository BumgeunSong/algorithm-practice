//
//  WordSearch.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/25.
//

import Foundation

func exist(_ board: [[Character]], _ word: String) -> Bool {
    let word = Array(word)
    
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if board[i][j] != word[0] { continue }
            if searchWord(i, j, chars: word, board) { return true }
        }
    }
    return false
}

func searchWord(_ i: Int, _ j: Int, chars: [Character], _ board: [[Character]]) -> Bool {
    guard chars.count > 0 else { return false }
    guard i >= 0 && i < board.count && j >= 0 && j < board[0].count else { return false }
    if board[i][j] != chars[0] { return false }
    if chars.count == 1 { return true }
    
    var board = board
    board[i][j] = Character("-")
    return searchWord(i-1, j, chars: Array(chars.dropFirst()), board)
    || searchWord(i+1, j, chars: Array(chars.dropFirst()), board)
    || searchWord(i, j-1, chars: Array(chars.dropFirst()), board)
    || searchWord(i, j+1, chars: Array(chars.dropFirst()), board)
}
