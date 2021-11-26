//
//  ReverseInteger.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/26.
//

import Foundation

func reverse(_ x: Int) -> Int {
    let reversed = String(String(abs(x)).reversed())
    guard let int32reversed = Int32(reversed) else { return 0 }
    return x >= 0 ? Int(int32reversed) : -Int(int32reversed)
}
