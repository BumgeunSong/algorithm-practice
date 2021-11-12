//
//  p1008.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/05.
//

import Foundation

struct Problem1008 {
    func start() {
        if let input = readLine(strippingNewline: true)?.components(separatedBy: " ") {
            let array = input.map{ Double($0) ?? 0 }
            print(array[0] / array[1])
        }
    }
}
