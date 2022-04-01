//
//  bojTemplate.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/01.
//

import Foundation

func readInput() {
    let lineArr = readLine()!.components(separatedBy: " ").map { Int($0)! }
    
    let a = lineArr[0]
    let b = lineArr[1]
    
    print(a+b)
}
