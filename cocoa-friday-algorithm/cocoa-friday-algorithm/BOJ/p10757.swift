//
//  p10757.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/05.
//

import Foundation

func p10757() {
    let lineArr = readLine()!.components(separatedBy: " ")
    var a = lineArr[0], b = lineArr[1]
    
    var carry = 0
    var finalSum = ""
    
    let maxCount = max(a.count, b.count)
    
    for i in 0..<maxCount {
        let aEnd = a.isEmpty ? 0 : a.last!.wholeNumberValue!
        let bEnd = b.isEmpty ? 0 : b.last!.wholeNumberValue!
        let sum = aEnd + bEnd + carry
        finalSum = "\(sum % 10)" + finalSum
        
        carry = sum / 10 >= 1 ? 1 : 0
        
        if !a.isEmpty { a.removeLast() }
        if !b.isEmpty { b.removeLast() }
    }
    
    if carry == 1 { finalSum = "1" + finalSum }
    print(finalSum)
}

