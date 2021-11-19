//
//  NumberLineJumps.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/19.
//

import Foundation

func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    if v1 > v2 {
        return (x2 - x1) % (v1 - v2) == 0 ? "YES" : "NO"
    }
    return "NO"
}
