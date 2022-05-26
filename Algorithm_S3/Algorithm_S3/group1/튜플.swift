//
//  튜플.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/17.
//

import Foundation

func 튜플(_ s: String) -> [Int] {
    var sets = parseString(s)
    sets.sort { $0.count < $1.count }
    
    let sumOfSets = sets.map { $0.reduce(0, +) }
    
    let diffOfSets = [sumOfSets[0]] + getDiff(sumOfSets)

    return diffOfSets
}

func parseString(_ s: String) -> [[Int]] {
    return s.removeParenthesis().map { $0.convertToIntArray() }
}

extension String {
    func removeParenthesis() -> [String] {
        return self.dropFirst(2).dropLast(2).components(separatedBy: "},{")
    }
    
    func convertToIntArray() -> [Int] {
        return self.components(separatedBy: ",").map { Int($0)! }
    }
}

func getDiff(_ nums: [Int]) -> [Int] {
    return (1..<nums.count).map { index in
        return nums[index] - nums[index-1]
    }
}


