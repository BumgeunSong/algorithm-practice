//
//  Rectangle.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/26.
//

import Foundation

func rectangle(_ w: Int, _ h: Int) -> Int64 {
    return Int64(w * h - (w + h - gcd(w,h)))
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    else { return gcd(b, a % b) }
}
