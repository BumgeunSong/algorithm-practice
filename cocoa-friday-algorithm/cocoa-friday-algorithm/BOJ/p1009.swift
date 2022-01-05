//
//  p1009.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/05.
//

import Foundation

func p1009() {
    let line1 = readLine()!
    let numberOfCase = Int(line1)!
    
    for _ in 0..<numberOfCase {
        let lineArr = readLine()!.components(separatedBy: " ")
        
        let a = (Int(lineArr[0])!) % 10
        var isPattern = false
        var oneDigitNum = 1
        var patternArr: [Int] = []
        
        while !isPattern {
            oneDigitNum = (oneDigitNum * a) % 10
            
            if patternArr.first == oneDigitNum {
                isPattern = true
            } else {
                patternArr.append(oneDigitNum)
            }
        }
        
        let b = (Int(lineArr[1])! - 1) % patternArr.count
        print(patternArr[b] == 0 ? 10 : patternArr[b])
    }
}
