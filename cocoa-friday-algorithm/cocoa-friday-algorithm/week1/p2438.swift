//
//  p2438.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/05.
//

import Foundation

struct Problem2438 {
    func start() {
        if let input = Int(readLine(strippingNewline: true)!) {
            for row in 1...input {
                print(String(repeating: "*", count: row))
            }
        }
    }
}
