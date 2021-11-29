//
//  validSudoku.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/21.
//

import Foundation

//func isValidSudoku(_ board: [[Character]]) -> Bool {
//
//    var isValid = true
//
//    for y in 0..<9 {
//        var numSet: Set<Character> = []
//        let numArray = board[y].filter { $0 != "." }
//        numArray.forEach { num in numSet.insert(num) }
//        isValid = isValid && numSet.count == numArray.count
//    }
//
//
//    for x in 0..<9 {
//        let numArray = board.map { $0[x] }.filter { $0 != "." }
//        var numSet: Set<Character> = []
//        numArray.forEach { num in numSet.insert(num) }
//        isValid = isValid && numSet.count == numArray.count
//    }
//
//    for x in 0..<3 {
//        for y in 0..<3 {
//            let yRange: Range = y*3..<y*3+3
//            let xRange: Range = x*3..<x*3+3
//            var numSet: Set<Character> = []
//            var numArray: Array<Character> = []
//
//            board[yRange].forEach { row in
//                let subrow = row[xRange].filter{$0 != "."}
//                subrow.forEach { num in
//                    numSet.insert(num)
//                    numArray.append(num)
//                }
//            }
//            print("numArray", numArray)
//            print("numSet", numSet)
//            print(numSet.count == numArray.count)
//            isValid = isValid && numSet.count == numArray.count
//        }
//    }
//
//    return isValid
//}

func isValidSudoku(_ board: [[Character]]) -> Bool {
    var seen = Set<String>()
    for i in 0..<9 {
        for j in 0..<9 {
            let currVal = board[i][j]
            if currVal == "." {
                continue
            }
            let row = "\(currVal) found in row \(i)"
            let col = "\(currVal) found in col \(j)"
            let box = "\(currVal) found in box \((i/3)) - \((j/3))"
            print(row)
            print(col)
            print(box)
            if seen.contains(row) {
                return false
            } else {
                seen.insert(row)
            }
            if seen.contains(col) {
                return false
            } else {
                seen.insert(col)
            }
            if seen.contains(box) {
                return false
            } else {
                seen.insert(box)
            }
        }
    }
    return true
}
