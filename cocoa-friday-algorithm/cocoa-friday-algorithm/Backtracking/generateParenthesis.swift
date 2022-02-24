//
//  generateParenthesis.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/24.
//

import Foundation

func generateParenthesis(_ n: Int) -> [String] {
    func backtrack(string: String) -> [String] {
        if string.count >= n * 2 { return [string] }
        
        let openCount = string.filter({ $0 == "("}).count
        
        var results = [String]()
        if openCount < n { results += backtrack(string: string + "(") }
        if string.count - openCount < openCount { results += backtrack(string: string + ")")  }
        return results
    }
    return backtrack(string: "")
}
