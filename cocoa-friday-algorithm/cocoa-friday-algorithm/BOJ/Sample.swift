//
//  BOJ.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/05.
//

import Foundation

func add() {
    let line = readLine()!
    let lineArr = line.components(separatedBy: " ")
    let a = Int(lineArr[0])!
    let b = Int(lineArr[1])!
    print(a+b)
}
