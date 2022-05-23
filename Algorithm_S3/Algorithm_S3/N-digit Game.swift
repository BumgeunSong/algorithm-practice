//
//  N-digit Game.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/23.
//

import Foundation





func 이진수게임(_ n: Int, _ t: Int, _ m: Int, _ p: Int) -> String {
    let targetLength = (m*t) + (p-1)
    let sequences = sequence(until: targetLength, radix: n)

    return stride(from: p-1, to: targetLength, by: m).reduce("") { partialResult, num in
        partialResult + "\(sequences[num])"
    }
}

func sequence(until length: Int, radix: Int) -> [Character] {
    var result = [Character]()
    var num = 0
    while result.count < length {
        result += Array(String(num, radix: radix, uppercase: true))
        num += 1
    }
    return result
}

// 배열을 넣었을 때, 앞에 N의 자릿수를 더해서 return한다.
func add(to nums: [String], _ digitString: [String]) -> [String] {
    var result = [String]()
    
    for i in digitString {
        result += nums.map { "\(i)" + $0 }
    }
    
    return result
}

func sequence(_ digitString: [String], toLength: Int) -> [String] {
    if toLength == 1 { return digitString }
    return add(to: sequence(digitString, toLength: toLength-1), digitString)
}

func makeDigitString(digit: Int) -> [String] {
    let hex = ["A","B","C","D","E","F"]
    if digit <= 10 {
        return (0..<digit).map { "\($0)" }
    } else {
        return (0..<10).map { "\($0)" } + (10..<digit).map { hex[$0-10] }
    }
}

func getTargetPower(targetIndex: Int, digit: Int) -> Int {
    // n^x >= mt + (p-1) 공식을 만족하는 x를 구한다.
    
    var len = digit
    var count = 1
    while len <= targetIndex  {
        len *= digit
        count += 1
    }
    return count
}

func makeCharArray(_ sequence: [String]) -> [Character] {
    let totalString = sequence.map { removeLeadingZero($0) }
        .reduce("") { $0 + $1 }
    return Array(totalString)
}


func removeLeadingZero(_ sequence: String) -> String {
    var sequence = sequence
    while sequence.first == "0", sequence.count > 1 { sequence.removeFirst() }
    return sequence
}




