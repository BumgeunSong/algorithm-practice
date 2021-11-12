//
//  p8958.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/05.
//

import Foundation

struct Problem8958 {
    func start() {
        if let size = Int(readLine()!) {
            for _ in 1...size {
                if let line = readLine() {
                    var streak = 0
                    let score = line.reduce(0) { result, OXstring in
                        streak = OXstring == "O" ? streak + 1 : 0
                        return OXstring == "O" ? result + streak : result
                    }
                    print(score)
                }
            }
        }
    }
}
