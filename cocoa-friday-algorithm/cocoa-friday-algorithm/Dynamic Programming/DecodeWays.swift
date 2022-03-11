//
//  DecodeWays.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/03/11.
//

import Foundation

func numDecodings(_ s: String) -> Int {
    let s = Array(s)
    if s[0] == "0" { return 0 }
    
    var ways = [1, 1]
    
    for i in 1..<s.count {
        var newWays = 0
        
        if s[i] != "0" { newWays += ways[i] }
        
        if s[i-1] != "0" && ((s[i-1].wholeNumberValue! * 10) + s[i].wholeNumberValue! <= 26) {
            newWays += ways[i-1]
        }
        
        ways.append(newWays)
    }
    
    return ways.last ?? 0
}
