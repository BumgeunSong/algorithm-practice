//
//  p1052.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/05.
//

import Foundation

func p1052() {
    let lineArr = readLine()!.components(separatedBy: " ")
    if let initialBottle = Int(lineArr[0]), let targetNum = Int(lineArr[1]) {
        
        var bottle = initialBottle

        while true {
            if numOfOne(dec2bin(bottle)) <= targetNum {
                print((bottle - initialBottle))
                break
            } else {
                let digitOfFirstOne = dec2bin(bottle).firstIndex(of: 1)!
                bottle += Int(pow(2.0, Double(digitOfFirstOne)))
            }
        }
    }
}

func dec2bin(_ dec: Int) -> [Int] {
    if dec == 0 { return [0] }
    
    var decimal = dec, answer = [Int]()
    
    while decimal >= 2 {
        let remainder = decimal % 2
        answer.append(remainder)
        decimal = decimal / 2
    }
    
    if decimal == 1 { answer.append(1) }
    
    return answer
}

func numOfOne(_ binary: [Int]) -> Int {
    return binary.filter { $0 == 1 }.count
}
