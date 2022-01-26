//
//  frequencySort.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/26.
//

import Foundation

func frequencySort(_ s: String) -> String {
    return s.reduce(into: [:]) { count, char in
        count[char, default: 0] += 1
    }.sorted(by: {
        $0.value > $1.value
    }).reduce(into: "") {
        $0 += String(repeating: $1.key, count: $1.value)
    }
}


//
//
//
//func partition(_ left: Int, _ right: Int, _ pivotIndex: Int) -> Int {
//    let pivotFrequency = count[charArray[pivotIndex]]!
//    charArray.swapAt(pivotIndex, left)
//
//    var pointer = left
//
//    for i in left...right {
//        if count[charArray[i]]! < pivotFrequency {
//            charArray.swapAt(pointer, i)
//            pointer += 1
//        }
//    }
//    charArray.swapAt(pointer, right)
//    return pointer
//}
//
//func quickSort(_ left: Int, _ right: Int) {
//    if left == right { return }
//    var pivotIndex = Int.random(in: left...right)
//    pivotIndex = partition(left, right, pivotIndex)
//
//    quickSort(left, pivotIndex)
//    quickSort(pivotIndex+1, right)
//}
//quickSort(0, charCount-1)
//return String(charArray)
