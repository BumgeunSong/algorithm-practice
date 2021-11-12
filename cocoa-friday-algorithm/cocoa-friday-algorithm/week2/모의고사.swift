//
//  모의고사.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/11.
//

import Foundation

func test(_ answers:[Int]) -> [Int] {
    let supoja1 = [1,2,3,4,5]
    let supoja2 = [2,1,2,3,2,4,2,5]
    let supoja3 = [3,3,1,1,2,2,4,4,5,5]
    
    var scores: [Int] = [0,0,0]
    
    for n in 0..<answers.count {
        if answers[n] == supoja1[n % supoja1.count] {
            scores[0] += 1
        }
        if answers[n] == supoja2[n % supoja2.count] {
            scores[1] += 1
        }
        if answers[n] == supoja3[n % supoja3.count] {
            scores[2] += 1
        }
    }
    
    var winner: [Int] = []
    for n in 0..<scores.count {
        if scores[n] == scores.max() {
            winner.append(n+1)
        }
    }
    return winner
}
