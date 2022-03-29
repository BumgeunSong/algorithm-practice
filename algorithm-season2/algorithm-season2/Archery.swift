//
//  Archery.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/03/27.
//  https://programmers.co.kr/learn/courses/30/lessons/92342

import Foundation

struct Kakao {
    static func winner(_ n: Int, _ info: [Int]) -> [Int] {
        
        var scores = Array(repeating: 0, count: 11)
        var shotToWins = Array(repeating: 0, count: 11)
        
        let getPerShot: [(index: Int, priority: Float)] = info.enumerated().map { (i, enemyShot) in
            let score = enemyShot > 0 ? (10 - i) * 2 : 10 - i
            let shotToWin = enemyShot + 1
            
            scores[i] = score
            shotToWins[i] = shotToWin
            
            return (i, Float(score) / Float(shotToWin))
        }
        
        let getPerShotSorted = getPerShot.sorted { lhs, rhs in
            lhs.priority > rhs.priority
        }
        
        let enemyScore = info.enumerated().reduce(0) {
            if $1.element > 0 {
                return $0 + (10 - $1.offset)
            } else {
                return $0
            }
        }
        
        var remain = n
        var myScore = 0
        var result = Array(repeating: 0, count: 11)
        
        for (index, _) in getPerShotSorted {
            
            if remain >= shotToWins[index] {
                result[index] = shotToWins[index]
                myScore += scores[index]
                remain -= shotToWins[index]
            } else if index == getPerShotSorted.count-1 {
                result[index] = remain
            } else {
                continue
            }
            
            
        }
        
        if myScore > enemyScore {
            return result
        } else {
            return [-1]
        }
    }
}
