//
//  main.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/05.
//

import Foundation
var board: [[Character]] = [["A","B","C","E"],
                            ["S","F","E","S"],
                            ["A","D","E","E"]]
let word = "ABCESEEEFS"

let result = exist(board, word)
print(result)
