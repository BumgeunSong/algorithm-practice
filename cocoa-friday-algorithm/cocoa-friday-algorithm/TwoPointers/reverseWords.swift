//
//  reverseWords.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/05.
//

import Foundation

func reverseWords(_ s: String) -> String {
    return s.split(separator: " ")
    .map({ String($0.reversed()) })
    .joined(separator: " ")
}
