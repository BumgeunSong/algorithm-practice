//
//  isPalindrome.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/26.
//

import Foundation

func isPalindrome(_ x: Int) -> Bool {
    return String(x) == String(String(x).reversed())
}
