//
//  SurroundedRegions.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/16.
//

import Foundation

func solve(_ board: inout [[Character]]) {
    guard board.count > 1 && board[0].count > 1 else { return }
    
    for i in 1..<board.count-1 {
        for j in 1..<board[0].count-1 {
            if board[i][j] == "O" &&
                !isConnectedToBorderO(i, j, board: &board) {
                board[i][j] = "X"
            }
        }
    }
    
    for i in 0..<board.count {
        for j in 0..<board[0].count where board[i][j] == "V" {
            board[i][j] = "O"
        }
    }
}


func isConnectedToBorderO(_ i: Int, _ j: Int, board: inout [[Character]]) -> Bool {
    if board[i][j] == "X" || board[i][j] == "V" { return false }
    
    
    if !(1..<board.count-1).contains(i) || !(1..<board[0].count-1).contains(j)  {
        return true
    }
    
    board[i][j] = "V"
    
    let isConnected = isConnectedToBorderO(i, j+1, board: &board) ||
    isConnectedToBorderO(i, j-1, board: &board) ||
    isConnectedToBorderO(i+1, j, board: &board) ||
    isConnectedToBorderO(i-1, j, board: &board)
    
    if !isConnected { board[i][j] = "X" }
    return isConnected
}

