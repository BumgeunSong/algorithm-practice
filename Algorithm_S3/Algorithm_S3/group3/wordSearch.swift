//
//  wordSearch.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/15.
//

import Foundation

func exist(_ board: [[Character]], _ word: String) -> Bool {
    let visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
    let word = Array(word)
    
    for i in board.indices {
        for j in board[0].indices where board[i][j] == word.first! {
            var visited = visited
            visited[i][j] = true
            if dfs((i,j), word, board, visited) { return true }
        }
    }
    
    return false
}

func dfs(_ root: Position, _ word: [Character], _ board: [[Character]], _ visited: [[Bool]]) -> Bool {
    let rootChar = board[root.x][root.y]
    
    guard word[0] == rootChar else { return false }
    if word.count == 1 { return true }
    
    for (dx, dy) in [(0, -1), (-1, 0), (0, 1), (1, 0)] {
        let newPos: Position = (root.x + dx, root.y + dy)
        
        guard (0..<board.count).contains(newPos.x) && (0..<board[0].count).contains(newPos.y), !visited[newPos.x][newPos.y], word[1] == board[newPos.x][newPos.y] else { continue }
        
        if word.count == 2 { return true }
        
        var visited = visited
        visited[newPos.x][newPos.y] = true
        
        if dfs(newPos, Array(word.dropFirst()), board, visited) {
            return true
        }
    }
    return false
}
