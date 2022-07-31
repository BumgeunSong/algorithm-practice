//
//  isIsomorphic.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/07/30.
//

import Foundation

func isIsomorphic(_ s: String, _ t: String) -> Bool {
    return occurrence(s) == occurrence(t)
}

func occurrence(_ string: String) -> Set<[Int]> {
    var result = [Character: [Int]]()
    for (i, char) in string.enumerated() {
        result[char, default: []].append(i)
    }
    return Set(result.values)
}
