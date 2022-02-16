//
//  main.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/05.
//

import Foundation

print("Let's get algorithm tested")

var board: [[Character]] = [["X","X","X","X"],
                            ["X","O","O","X"],
                            ["X","X","O","X"],
                            ["X","O","X","X"]]

solve(&board)
for row in board {
    print(row)
}
print("---")
var board2: [[Character]] = [["O","O","O","O","X","X"],
                             ["O","O","O","O","O","O"],
                             ["O","X","O","X","O","O"],
                             ["O","X","O","O","X","O"],
                             ["O","X","O","X","O","O"],
                             ["O","X","O","O","O","O"]]

solve(&board2)
for row in board2 {
    print(row)
}

print([["O","O","O","O","X","X"],
 ["O","O","O","O","O","O"],
 ["O","X","O","X","O","O"],
 ["O","X","O","O","X","O"],
 ["O","X","O","X","O","O"],
 ["O","X","O","O","O","O"]])

