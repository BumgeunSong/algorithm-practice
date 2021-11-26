//
//  longestCommonPrefix.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/26.
//

import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
    
    let arr = strs.map { $0.map { "\($0)" } }
    var prefix = ""
    
    for i in 0..<arr[0].count {
        let letter = arr[0][i]
        for row in arr {
            if i >= row.count {
                return prefix
            }
            if letter != row[i] {
                return prefix
            }
        }
        prefix += letter
    }
    
    return prefix
}
