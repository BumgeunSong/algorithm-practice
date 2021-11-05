//
//  p2920.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/05.
//

import Foundation

struct Problem2920 {
    func start() {
        if let input = readLine(strippingNewline: true)?.components(separatedBy: " ") {
            if input == input.sorted() {
                print("ascending")
            } else if input == input.sorted(by: { a, b in return a > b }) {
                print("descending")
            } else {
                print("mixed")
            }
        }
    }
}
