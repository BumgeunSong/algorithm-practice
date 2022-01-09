//
//  findTheWinner.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/09.
//

import Foundation

func findTheWinner(_ n: Int, _ k: Int) -> Int {
    var circle = Array(1...n)
    var loseCount = 0

    var index = 1
    while loseCount < n-1 {
        if index % k == 0 { loseCount += 1 }
        else {
            let winner = circle[index-1]
            circle.append(winner)
        }
        index += 1
    }
    return circle.last!
}
